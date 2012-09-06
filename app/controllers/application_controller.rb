class ApplicationController < ActionController::Base
  protect_from_forgery

  def store_location
    session[:return_url] = request.fullpath if session[:return_url].nil? && !user_signed_in?
  end

  def after_sign_in_path_for(resource)
    location = session[:return_url]
    session[:return_url] = nil
    (location.nil?) ? "/" : location.to_s
  end
end
