class Donation < ActiveRecord::Base
  belongs_to :campaign, :foreign_key => :campaign_id, :class_name => Campaign.name
end
