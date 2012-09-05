describe CampaignsController do

	describe '#new' do
	  it "should create a campaign with a type from params" do
	    post :new, :campaign_type => :birthday

	    campaign = assigns(:campaign)
	    puts campaign.inspect
	    campaign.campaign_type.should eql :birthday
	  end
	end

	describe '#create' do
		it 'should create a campaign with given params'


	end
end