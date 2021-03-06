describe UsersController do

  describe 'user is logged in' do
    it "should list all user's campaigns when she logs in" do
      user = FactoryGirl.create(:user)
      login_as user

      my_30s_bday = FactoryGirl.create(:birthday, :title => 'My 30th birthday', :owner => user)
      xmas_campaign = FactoryGirl.create(:birthday, :title => 'Christmas is for everyone', :owner => user)

      get :show, :id => user.id

      assigns(:campaigns).should =~ [my_30s_bday, xmas_campaign]
    end
  end

  describe 'user is not logged in' do
    it "should not list any campaigns" do
      user = FactoryGirl.create(:user)

      get :show, :id => user.id

      assigns(:campaigns).should eql nil
    end
  end

end