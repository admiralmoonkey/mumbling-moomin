var refreshRating = function(){
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
    return $(this).attr('data-score');
    }
  });
};
// $(document).on('turbolinks:load ajaxSuccess', function(){
$(document).on('turbolinks:load ajaxSuccess', function () {
  $('.img-zoom').elevateZoom({
      zoomWindowFadeIn: 500,
      zoomWindowFadeOut: 500,
      lensFadeIn: 500,
      lensFadeOut: 500,
      zoomWindowPosition: 1,
      zoomWindowOffetx: 50});

  // $(window).on('scroll', function() {
  //     var scrollTop = $(this).scrollTop();
  //
  //     $('#navigation-header').each(function() {
  //       var topDistance = $(this).offset().top;
  //
  //       if ((topDistance-60) <= scrollTop ) {
  //           $('#navigation-header').addClass('navigationTop');
  //           $('.content').css('margin-top', '60px')
  //           $('.content').css('margin-bottom', '120px')
  //       }
  //     });
  // });
    refreshRating();
});
