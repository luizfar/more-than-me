class DonationService
  def setup_donation(campaign, amount, cancel_url, return_url, remote_ip)
    currency = :usd
    gateway = new_gateway

    formatted_amount = Money.new(amount, currency).format(symbol: true)
    description = "Donation of #{formatted_amount} to #{campaign.owner.full_name}'s campaign on the More Than Me Platform"
    order_id = UUID.generate.to_s
    response = gateway.setup_purchase(amount,
      ip: remote_ip,
      currency: currency.to_s.upcase,
      return_url: append_to_url(return_url, 'order_id', order_id),
      cancel_return_url: cancel_url,
      no_shipping: 1,
      order_id: order_id,
      description: description,
      items: [{amount: amount, name: description}])

    raise DonationError.new(response) unless response.success?

    donation_request = DonationRequest.new(
      :campaign_id => campaign.id,
      :order_id => order_id,
      :currency => currency,
      :amount_in_cents => amount,
      :token => response.token
    )
    donation_request.save!

    gateway.redirect_url_for(response.token)
  end

  def complete_donation(token, payer_id, order_id)
    gateway = new_gateway
    puts "token #{token}"
    puts "order_id #{order_id}"
    donation_request = DonationRequest.where(token: token, order_id: order_id).first

    response = gateway.purchase(donation_request.amount_in_cents,
      currency: donation_request.currency.to_s.upcase,
      payer_id: payer_id,
      token: token)

    raise DonationError.new(response) unless response.success?

    transaction_info = gateway.details_for(token)

    donation = Donation.new(
      campaign: Campaign.find(donation_request.campaign_id),
      order_id: order_id,
      currency: donation_request.currency,
      amount_in_cents: donation_request.amount_in_cents,
      payer_email: transaction_info.email,
      payer_first_name: transaction_info.info['PayerName']['FirstName'],
      payer_last_name: transaction_info.info['PayerName']['LastName'],
      transaction_id: response.authorization)

    donation.save!
    donation
  end

  private

  def new_gateway
    ActiveMerchant::Billing::Base.gateway_mode = :test if Rails.env.development? || Rails.env.test?
    ActiveMerchant::Billing::PaypalExpressGateway.new({
      login: ENV['MTM_PAYPAL_LOGIN'],
      password: ENV['MTM_PAYPAL_PASSWORD'],
      signature: ENV['MTM_PAYPAL_SIGNATURE']
    })
  end

  def append_to_url(url, param_name, param_value)
    url.include?('?') ? "#{url}&#{param_name}=#{param_value}" : "#{url}?#{param_name}=#{param_value}"
  end
end
