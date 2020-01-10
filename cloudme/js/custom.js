(function($){ 
  "use strict";

$('.blog-header').parent().addClass('bg-blog');
$('.slicknav_nav, .top').find('ul.dropdownx-menu').removeClass('dropdownx-menu');
$('.vps-order-steps').parents('.wpb_column').addClass('ot-vps-order');
$('.shared').parents('.colx-sm-12').removeClass('colx-sm-12');
$('.about-us-links').parents('.vc_column_container').addClass('padd-0');

// ______________ SUPERFISH
jQuery('ul.sf-menu').superfish({
      speed : 1,
      animation: false,
      animationOut: false
});

// ______________ MOBILE MENU

 $(function(){
       $('nav.mobile-menu').slicknav({
          closedSymbol: "&#8594;",
          openedSymbol: "&#8595;"
});
});  



// SMOOTH SCROLL________________________//
$('.sf-menu a[href^="#"], a.scroll[href^="#"]').on('click', function (e) {
  if (!$(this).hasClass('quick-nav')) {
    e.preventDefault();

    var target = this.hash,
      $target = jQuery(target);

    $('html, body').stop().animate({
      'scrollTop': $target.offset().top - 100// - 200px (nav-height)
    }, 800, 'easeInOutExpo', function () {
      //window.location.hash = '1' + target;
    });
  }
});

// ______________ BACK TO TOP BUTTON

$(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
      $('#back-to-top').fadeIn('slow');
    } else {
      $('#back-to-top').fadeOut('slow');
    }
  });
$('#back-to-top').click(function(){
  $("html, body").animate({ scrollTop: 0 }, 600);
  return false;
});






	
$(window).scroll(function () {

    var $h1 = $('.top.sticky');

    if ($h1.length > 0) {

      if ($(this).scrollTop() > 40) {

        $('.top.sticky').addClass('sticked');

      } else {

        $('.top.sticky').removeClass('sticked');

      }

    }

  });

})(jQuery);