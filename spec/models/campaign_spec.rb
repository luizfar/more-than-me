describe Campaign do
	describe 'amount needed for one more girl' do
 		it	"should return 10000 for 15000 cents total donation" do 
 			campaign = FactoryGirl.create(:birthday)
 			campaign.amount_needed_for_one_more_girl.should eql 10000
 		end

		it	"should return 20000 for 30000 cents total donation" do 
 			campaign = FactoryGirl.create(:sporty)
 			campaign.amount_needed_for_one_more_girl.should eql 20000
 		end
 	end
	describe 'progress bar' do
		it	"should return 30 for 30000" do 
			campaign = FactoryGirl.create(:sporty)
 			campaign.progress.should eql 30
 		end
	end
end