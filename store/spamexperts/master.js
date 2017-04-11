$(document).ready(function() {
    $('#inputDomainChooser').multiselect({
        buttonWidth: '250px',
        dropRight: true,
        nonSelectedText: 'Choose domain(s)'
    });

    $('.landing-page.mail-services .get-started .choose-product button').click(function(e) {
        var product = $(this).data('product');
        $('.landing-page.mail-services .get-started .choose-product button').removeClass('active');
        $(this).addClass('active');
        $('.landing-page.mail-services .get-started .additional-options .option').hide();
        $('.landing-page.mail-services .get-started .additional-options .options-' + product).show();
        $('.landing-page.mail-services .get-started .price').hide();
        $('.landing-page.mail-services .get-started .price-' + product).show();
        $('#productKey').val('spamexperts_' + product);
    });

    $('.landing-page.mail-services .get-started .additional-options input[type="checkbox"]').click(function(e) {
        if ($(this).is(":checked")) {
            $('.landing-page.mail-services .get-started .price').hide();
            $('.landing-page.mail-services .get-started .price-' + $(this).val()).show();
            $('#productKey').val('spamexperts_' + $(this).val());
        } else {
            var product = $('.landing-page.mail-services .get-started .choose-product button.active').data('product');
            $('.landing-page.mail-services .get-started .price').hide();
            $('.landing-page.mail-services .get-started .price-' + product).show();
            $('#productKey').val('spamexperts_' + product);
        }
    });

    $('.btn-learn-more').click(function(e) {
        e.preventDefault();
        $('#howitworks a[href="#' + $(this).data('target') + '"]').tab('show');
        smoothScroll('#howitworks');
    });

    $('.btn-buy').click(function(e) {
        e.preventDefault();
        $('#pricing button[data-product="' + $(this).data('target') + '"]').click();
        smoothScroll('#pricing');
    });
});

function smoothScroll(element) {
    $('html, body').animate({
        scrollTop: $(element).offset().top
    }, 500);
}
