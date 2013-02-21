var mtm = mtm || {};

mtm.createCampaign = function (campaignView) {
  var self = {};

  self.bind = function () {
    if (!campaignView.form) {
      return;
    }
    
    campaignView.goal.blur(function(){
      if(isGoalAmountInvalid($(this))){
        campaignView.goalErrorMessage.show();
        campaignView.changeToErrorBackground(campaignView.goal);  
      } 
      $(this).val();
    });

    campaignView.submitButton.click(function (e) {
      e.preventDefault();
      if (validCampaignForm(campaignView)){
        campaignView.form.submit();
      }
      
    });
  };

  var validCampaignForm = function(campaignView){
    var formValid = true;
    if (isEmpty(campaignView.title)){
      campaignView.changeToErrorBackground(campaignView.title);
      formValid =false;
    }

    if (isEmpty(campaignView.description)) {
      campaignView.changeToErrorBackground(campaignView.description);
      formValid =false;
    }  

    if (isGoalAmountInvalid(campaignView.goal)) {
      campaignView.goalErrorMessage.show();
      campaignView.changeToErrorBackground(campaignView.goal);
      formValid =false;
    } 
    return formValid;   
  };

  var isGoalAmountInvalid = function(goal){
    var regex = /^[0-9]+(\.[0-9]{1,2})?$/;
    var validFormat = goal.val().search(regex) === 0;
    return validFormat ? parseFloat(goal.val()) < 1 : true;
  };

  var isEmpty = function(element){
    return $.trim(element.val()).length === 0;
  };

  return self;
};

$(function () {
  var campaignView = campaignView || {};
  campaignView.submitButton = $('#create-campaign');
  campaignView.form = $('#new_campaign');
  campaignView.title = $('#campaign_title');
  campaignView.description = $('#campaign_description');
  campaignView.goalErrorMessage = $('#error-goal');
  campaignView.goal = $('#goal');
  campaignView.changeToErrorBackground = function(element){
    element.addClass('error-background');
  };
  mtm.createCampaign(campaignView).bind();
});
