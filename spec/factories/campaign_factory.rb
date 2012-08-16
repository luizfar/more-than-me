FactoryGirl.define do
  factory :campaign do
    title          "My 20th birthday!"
    description    "Donate money instead of buying me presents!"
    goal_in_cents  100000
    end_date       Date.today + 30.days
    owner          { FactoryGirl.create(:user) }
  end
end