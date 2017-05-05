jQuery(document).ready(function(){
    jQuery('.cycle-change').on('click', function() {
        var newCycle = jQuery(this).data('cycle');
        jQuery('span.pricing-text').hide();
        jQuery('span.' + newCycle).removeClass('hidden').show();
        jQuery('.cycle-change').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.weebly-plans input[name="billingcycle"]').val(newCycle);
        jQuery('.weebly-plans div.pricing-item').each(function(index) {
            if (jQuery(this).find('span.' + newCycle).length <= 0) {
                jQuery(this).find('span.not-available').removeClass('hidden').show();
                jQuery(this).parent('div').find('.btn-signup').prop('disabled', true);
                jQuery(this).fadeTo('slow', 0.5);
            } else {
                jQuery(this).find('span.not-available').hide();
                jQuery(this).parent('div').find('.btn-signup').prop('disabled', false);
                jQuery(this).fadeTo('slow', 1);
            }
        });
    });

    var startCycle = jQuery('.btn.cycle-change.active').data('cycle');
    jQuery('.weebly-plans input[name="billingcycle"]').val(startCycle);
});

function smoothScroll(element) {
    jQuery('html, body').animate({
        scrollTop: jQuery(element).offset().top
    }, 500);
}
