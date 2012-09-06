describe CampaignsController do
  include Devise::TestHelpers

  before :each do
    request.env['warden'] = mock(Warden, :authenticate => FactoryGirl.create(:user), :authenticate! => FactoryGirl.create(:user))
  end

  describe '#new' do
    it "should create a campaign with a type from params" do
      post :new, :campaign_type => :birthday

      campaign = assigns(:campaign)
      campaign.campaign_type.should eql :birthday
    end
  end

end