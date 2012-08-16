describe UsersController do

  describe 'user is logged in' do
    it "should list all user's campaigns when she logs in" do
      user = FactoryGirl.create(:user)
      login_as user
      
      my_30s_bday = FactoryGirl.create(:campaign, :title => 'My 30th birthday', :owner => user)
      xmas_campaign = FactoryGirl.create(:campaign, :title => 'Christmas is for everyone', :owner => user)

      get :index

      assigns(:campaigns).should =~ [my_30s_bday, xmas_campaign]
    end
  end

  describe 'user is not logged in' do
    it "should not list any campaigns" do
      get :index

      assigns(:campaigns).should eql nil
    end
  end

end