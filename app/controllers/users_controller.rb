class UsersController < Devise::SessionsController
  before_filter :authenticate_user!
end