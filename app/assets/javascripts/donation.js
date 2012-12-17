var mtm = mtm || {};

mtm.donation = function (donationButton, donationForm) {
  var self = {};

  self.bind = function () {
    if (!donationButton || !donationForm) {
      return;
    }

    donationButton.click(function () {
      var popup = mtm.popup(donationForm);
      popup.showBelow(donationButton);
    });
  };

  return self;
};

$(function () {
  var donationButton = $('#donate-button');
  var donationForm = $('#donation-form');
  mtm.donation(donationButton, donationForm).bind();
});
