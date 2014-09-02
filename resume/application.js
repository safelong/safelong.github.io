! function($) {
  $(function() {
    var $window = $(window);
    var $body = $(document.body);
    $body.scrollspy({
      target: '.bs-sidebar',
      offset: 20
    });
    $window.on('load', function() {
      $body.scrollspy('refresh');
    });
  });
}(window.jQuery);
