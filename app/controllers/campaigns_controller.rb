class CampaignsController < ApplicationController
  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new(:campaign_type => params[:campaign_type].to_sym)
  end

  def create
    @campaign = Campaign.new(params[:campaign].merge(:owner => current_user, :end_date => Date.today + 30.days))
    if user_signed_in?
      store_temp_campaign_data
      do_create
    else
      store_temp_campaign_data
      authenticate_user!
    end
  end

  def do_create
    @campaign ||= session[:campaign]
    @campaign.save!
    redirect_to campaign_path(@campaign)
  end

  private

  def store_temp_campaign_data
    session[:campaign] = @campaign
    session[:return_url] = do_create_campaigns_url
  end
end
