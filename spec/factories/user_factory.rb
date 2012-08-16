FactoryGirl.define do
  sequence :email do |i|
    "calvin+#{i}@example.com"
  end

  factory :user do
    email      { generate(:email) }
    password   "abobrinha"
  end
end