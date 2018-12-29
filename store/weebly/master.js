jQuery(document).ready(function(){
    jQuery('.landing-page.weebly .cycle-change').on('click', function() {
        var newCycle = jQuery(this).data('cycle');
        jQuery('.landing-page.weebly .pricing-text').hide();
        jQuery('.landing-page.weebly .' + newCycle).removeClass('hidden').show();
        jQuery('.landing-page.weebly .cycle-change').removeClass('active');
        jQuery(this).addClass('active');
        jQuery('.landing-page.weebly .pricing input[name="billingcycle"]').val(newCycle);
        var $litePlan = jQuery('.landing-page.weebly .weebly-lite-plan');
        if ($litePlan.find('.' + newCycle).length <= 0) {
            $litePlan.find('.not-available').removeClass('hidden').show();
            $litePlan.find('.btn-signup').prop('disabled', true);
        } else {
            $litePlan.find('.not-available').hide();
            $litePlan.parent('div').find('.btn-signup').prop('disabled', false);
        }
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
