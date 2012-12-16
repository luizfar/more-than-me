class AddDonationRequest < ActiveRecord::Migration
  def change
    create_table 'donation_requests' do |t|
      t.integer :campaign_id
      t.string  :order_id
      t.string  :currency
      t.integer :amount_in_cents
      t.string  :token
    end
    create_table 'donations' do |t|
      t.integer :campaign_id
      t.string  :order_id
      t.string  :currency
      t.integer :amount_in_cents
      t.string  :payer_email
      t.string  :payer_first_name
      t.string  :payer_last_name
      t.string  :transaction_id
    end
  end
end
