class CampaignsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new(:campaign_type => params[:campaign_type].to_sym)
  end

  def create
    @campaign = Campaign.new(params[:campaign].merge(:owner => current_user, :end_date => Date.today + 30.days))
    @campaign.save!
    redirect_to campaign_path(@campaign)
  end
end
