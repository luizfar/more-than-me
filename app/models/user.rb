class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,
    :password,
    :password_confirmation,
    :first_name,
    :last_name,
    :location
    :remember_me
  after_create :send_welcome_email

  validates_presence_of :first_name, :last_name, :location
  before_create :initialize_amount_raised

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  def initialize_amount_raised
    self.amount_raised_in_cents ||= 0
  end
end
