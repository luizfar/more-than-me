class Campaign < ActiveRecord::Base
  belongs_to :owner, :foreign_key => :user_id, :class_name => User.name
  validates_presence_of :campaign_type
end