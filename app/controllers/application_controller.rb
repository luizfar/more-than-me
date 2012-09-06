class ApplicationController < ActionController::Base
  before_filter :store_location
  protect_from_forgery

  def store_location
    session[:return_url] = request.referer unless user_signed_in?
  end

  def after_sign_in_path_for(resource)
    location = session[:return_url]
    session[:return_url] = nil
    (location.nil?) ? "/" : location.to_s
  end
end
