class Campaign < ActiveRecord::Base
  belongs_to :owner, :foreign_key => :user_id, :class_name => User.name
  validates_presence_of :campaign_type
  has_many :donations

  def amount_raised_in_cents
    donations.inject(0) do |sum, donation|
      sum + donation.amount_in_cents
    end
  end

  def progress
    amount_raised_in_cents / goal_in_cents * 100
  end

  def days_left
    (end_date.to_date - Date.today).to_i
  end
end
