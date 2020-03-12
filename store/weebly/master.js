jQuery(document).ready(function(){
    jQuery('.landing-page.weebly .cycle-change').on('click', function() {
        var newCycle = jQuery(this).data('cycle');
        jQuery('.row.weebly-plans .pricing-text').hide();
        jQuery('.landing-page.weebly .' + newCycle).removeClass('hidden').show();
        jQuery('.landing-page.weebly .cycle-change').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.landing-page.weebly .pricing input[name="billingcycle"]').val(newCycle);
        jQuery('.weebly-plans div.pricing-item').each(function(index) {
            if (jQuery(this).find('.' + newCycle).length <= 0) {
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
    jQuery('.landing-page.weebly .pricing input[name="billingcycle"]').val(startCycle);
});
