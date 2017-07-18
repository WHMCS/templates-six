jQuery(document).ready(function(){
    jQuery('.cycle-change').on('click', function() {
        var newCycle = jQuery(this).data('cycle');
        jQuery('span.pricing-text').hide();
        jQuery('span.' + newCycle).removeClass('hidden').show();
        jQuery('.cycle-change').removeClass('active');
        jQuery(this).addClass('active');
    });
});

function smoothScroll(element) {
    jQuery('html, body').animate({
        scrollTop: jQuery(element).offset().top
    }, 500);
}
