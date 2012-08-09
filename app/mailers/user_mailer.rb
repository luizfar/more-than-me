class UserMailer < ActionMailer::Base
  default from: "noreply@morethanme.com"

  def welcome_email(user)
    @user = user
    @url  = "http://more-than-me.herokuapp.com"
    mail(:to => user.email, :subject => "Welcome to More Than Me!")
  end
end
