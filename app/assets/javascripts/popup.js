var mtm = mtm || {};

mtm.popup = function (content) {
  var self = {};
  
  var ESCAPE = 27;
  var body = $('body');
  var overlay = $('#popup-overlay');
  overlay.css('z-index', '9000');
  content.css('z-index', '9001');

  function hide() {
    overlay.hide();
    content.hide();
  }

  overlay.click(function () {
    hide();
  });

  body.keyup(function (e) {
    if (e.keyCode === ESCAPE) {
      hide();
    }
  });

  self.show = function () {
    overlay.show();
    content.show();
  };

  self.showBelow = function (element) {
    overlay.show();
    var x = element.offset().left + element.outerWidth() / 2;
    var y = element.offset().top + element.outerHeight();
    content.css('left', (x - content.outerWidth() / 2) + 'px');
    content.css('top', y + 'px');
    content.css('display', 'block');
    body.animate({scrollTop: content.offset().top}, 600);
  };

  return self;
};
