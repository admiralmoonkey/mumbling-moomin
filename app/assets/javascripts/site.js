$(document).on('turbolinks:load', function(){
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });

  $('.rated').raty({ path: '/assets',
    readOnly: true,
    score: function() {
    return $(this).attr('data-score');
    }
  });
});

$(document).ready(function() {
  $(window).on('scroll', function() {
      var scrollTop = $(this).scrollTop();

      $('#navigation-header').each(function() {
        var topDistance = $(this).offset().top;

        if ((topDistance-60) <= scrollTop ) {
            $('#navigation-header').addClass('navigationTop');
            $('.content').css('margin-top', '60px')
            $('.content').css('margin-bottom', '120px')
        }
      });
  });
});
