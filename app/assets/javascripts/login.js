var mtm = mtm || {};

mtm.login = function (loginLink, loginForm) {
  var self = {};

  self.bind = function () {
    if (!loginLink || !loginForm) {
      return;
    }

    loginLink.click(function (e) {
      e.preventDefault();
      var popup = mtm.popup(loginForm);
      popup.showBelow(loginLink);
    });
  };

  return self;
};

$(function () {
  var loginLink = $('#log-in-link');
  var loginForm = $('#login-form');
  mtm.login(loginLink, loginForm).bind();
});
