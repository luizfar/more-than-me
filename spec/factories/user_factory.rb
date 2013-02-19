FactoryGirl.define do
  sequence :email do |i|
    "calvin+#{i}@example.com"
  end

  factory :user do
    email      { generate(:email) }
    first_name { 'Holden' }
    last_name  { 'Caulfield' }
    location   { 'New York, NY' }
    password   "abobrinha"
  end
end