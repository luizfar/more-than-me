FactoryGirl.define do
  factory :birthday, class: Campaign do
    title          "My 20th birthday!"
    description    "Donate money instead of buying me presents!"
    goal_in_cents  100000
    end_date       Date.today + 30.days
    owner          { FactoryGirl.create(:user) }
    donations      { [FactoryGirl.create(:donation)]} 
    campaign_type  :birthday
  end
  factory :sporty, class: Campaign do
    title          "My 20th birthday!"
    description    "Donate money instead of buying me presents!"
    goal_in_cents  100000
    end_date       Date.today + 30.days
    owner          { FactoryGirl.create(:user) }
    donations      { [FactoryGirl.create(:donation), FactoryGirl.create(:donation)]} 
    campaign_type  :sporty
  end
end