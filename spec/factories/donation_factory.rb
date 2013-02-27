FactoryGirl.define do
  factory :donation, class: Donation do
    campaign_id          "1234"
    order_id    "order id"
    amount_in_cents  15000
    payer_email       "bob@email.com"
    payer_first_name  "bob"
    payer_last_name  "smith"
    transaction_id  "1234"
  end
end