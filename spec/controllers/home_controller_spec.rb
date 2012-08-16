describe HomeController do
  include Devise::TestHelpers

  it "should redirect to users if the user is logged in" do
    @user = FactoryGirl.create(:user)
    login_as @user

    get :index

    response.should redirect_to users_path
  end
end