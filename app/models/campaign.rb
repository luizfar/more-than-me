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
    amount_raised_in_cents / goal_in_cents
  end

  def amount_needed_for_one_more_girl
    @amount_per_year_in_cents = 25000
    puts amount_raised_in_cents
    @amount_per_year_in_cents - (amount_raised_in_cents - (number_of_girls_in_school * @amount_per_year_in_cents)) 

  end

  def days_left
    (end_date.to_date - Date.today).to_i
  end

  private

  def number_of_girls_in_school  
    (amount_raised_in_cents / @amount_per_year_in_cents).to_i
  end
end
