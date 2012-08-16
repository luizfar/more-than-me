class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    user = current_user
    @campaigns = Campaign.where(:user_id => user.id)
  end
end