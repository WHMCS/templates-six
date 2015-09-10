/**
 * Javascript functions used in the domain checker to power
 * search, suggestions and whois functionality.
 *
 * @file WHMCS Domain Checker Javascript Functions
 * @copyright Copyright 2015 WHMCS Limited
 */

jQuery('#frmDomainChecker').submit(function (e) {
    e.preventDefault();

    var invalidDomainCharacters = /[\s\=_!"#%&'*{},\/:;?\(\)\[\]@\\$\^*+<>~`\u00a1\u00a7\u00b6\u00b7\u00bf\u037e\u0387\u055a-\u055f\u0589\u05c0\u05c3\u05c6\u05f3\u05f4\u0609\u060a\u060c\u060d\u061b\u061e\u061f\u066a-\u066d\u06d4\u0700-\u070d\u07f7-\u07f9\u0830-\u083e\u085e\u0964\u0965\u0970\u0af0\u0df4\u0e4f\u0e5a\u0e5b\u0f04-\u0f12\u0f14\u0f85\u0fd0-\u0fd4\u0fd9\u0fda\u104a-\u104f\u10fb\u1360-\u1368\u166d\u166e\u16eb-\u16ed\u1735\u1736\u17d4-\u17d6\u17d8-\u17da\u1800-\u1805\u1807-\u180a\u1944\u1945\u1a1e\u1a1f\u1aa0-\u1aa6\u1aa8-\u1aad\u1b5a-\u1b60\u1bfc-\u1bff\u1c3b-\u1c3f\u1c7e\u1c7f\u1cc0-\u1cc7\u1cd3\u2016\u2017\u2020-\u2027\u2030-\u2038\u203b-\u203e\u2041-\u2043\u2047-\u2051\u2053\u2055-\u205e\u2cf9-\u2cfc\u2cfe\u2cff\u2d70\u2e00\u2e01\u2e06-\u2e08\u2e0b\u2e0e-\u2e16\u2e18\u2e19\u2e1b\u2e1e\u2e1f\u2e2a-\u2e2e\u2e30-\u2e39\u3001-\u3003\u303d\u30fb\ua4fe\ua4ff\ua60d-\ua60f\ua673\ua67e\ua6f2-\ua6f7\ua874-\ua877\ua8ce\ua8cf\ua8f8-\ua8fa\ua92e\ua92f\ua95f\ua9c1-\ua9cd\ua9de\ua9df\uaa5c-\uaa5f\uaade\uaadf\uaaf0\uaaf1\uabeb\ufe10-\ufe16\ufe19\ufe30\ufe45\ufe46\ufe49-\ufe4c\ufe50-\ufe52\ufe54-\ufe57\ufe5f-\ufe61\ufe68\ufe6a\ufe6b\uff01-\uff03\uff05-\uff07\uff0a\uff0c\uff0e\uff0f\uff1a\uff1b\uff1f\uff20\uff3c\uff61\uff64\uff65]+/g;

    var invalidDomainError = jQuery("#invalidDomainError");
    var stepResults = jQuery("#stepResults");
    var pricingTable = jQuery("#pricingTable");
    var primarySearchResults = jQuery("#primarySearchResults");
    var currencyChoice = jQuery('.currencychooser');

    var reCaptchaValue = jQuery('#g-recaptcha-response');
    var captchaValue = jQuery('#inputCaptcha');
    var captchaImage = jQuery('#inputCaptchaImage');
    var captchaResponse = '';

    var domainInput = jQuery("#inputDomain").val()
        .replace(/^\s+|\s+$/, '')
        .toLocaleLowerCase();

    invalidDomainCharacters.lastIndex = undefined;

    // validate domain input
    if (!domainInput) {
        showDomainWarning("#searchTermRequired");
        return;
    } else if (invalidDomainCharacters.test(domainInput)) {
        showDomainWarning("#invalidChars");
        return;
    }

    if (reCaptchaValue.length) {
        captchaResponse = "&g-recaptcha-response=" + reCaptchaValue.val();
    } else if (captchaValue.length) {
        captchaResponse = "&code=" + captchaValue.val();
    }

    jQuery("#btnCheckAvailability").html('<i class="fa fa-spinner fa-spin"></i>');

    // perform spin
    jQuery.post(
        "domainchecker.php",
        "responseType=json&token=" + csrfToken + "&domain=" + domainInput + captchaResponse,
        function(data) {
            jQuery("#btnCheckAvailability").html(langSearch);

            var hasError = false;
            if (!data.validDomain) {
                // domain was invalid
                invalidDomainError.html(data.errorMsg);
                showDomainWarning("#invalidDomainError");
                primarySearchResults.hide();
                hasError = true;
            }

            if (data.output) {
                if (!hasError) {
                    jQuery(".domain-checker-error").slideUp();
                }
                stepResults.html(data.output);
                currencyChoice.hide();
                pricingTable.hide();
                if (!stepResults.is(":visible")) {
                    stepResults.hide().removeClass('hidden').fadeIn("slow");
                }
            }

            if (typeof grecaptcha !== 'undefined' && reCaptchaValue.val() != '') {
                grecaptcha.reset();
            }

            if (captchaImage.length) {
                captchaImage.attr("src", "includes/verifyimage.php?timestamp=" + new Date().getTime());
                captchaValue.val('');
            }
        },
        'json'
    );
});

jQuery(document).ready(function() {
    var inputBulkDomains = jQuery('#inputBulkDomains');

    if (inputBulkDomains.val() === '') {
        inputBulkDomains.val(langBulkPlaceholder)
            .css('color', '#ccc');
    }

    inputBulkDomains.focus(function() {
        if (jQuery(this).val() === langBulkPlaceholder) {
            jQuery(this).val('')
                .css('color', '#000');
        }
    });

    inputBulkDomains.blur(function() {
        if (jQuery(this).val() === '') {
            jQuery(this).val(langBulkPlaceholder)
                .css('color', '#ccc');
        }
    });
});

function addToCart(clickedBtn, performAvailabilityCheck, orderType, years) {

    var selectedDomain = jQuery(clickedBtn).closest('tr')
        .find('td:first strong')
        .html();
    var appendYears = '';
    if (typeof years != "undefined") {
        clickedBtn = jQuery(clickedBtn).closest('div')
            .find('button:first');
        appendYears = '&reg_period=' + years;
    }

    var cartDropDown = jQuery(clickedBtn).closest('div')
        .find('button.additional-options');
    if (typeof cartDropDown != "undefined") {
        jQuery(cartDropDown).attr('disabled', 'disabled');
    }

    jQuery(clickedBtn).attr('disabled', 'disabled')
        .html('<span class="glyphicon glyphicon-shopping-cart"></span> ' + langAdding + '...');

    jQuery.post(
        "domainchecker.php",
        "addtocart=1&check=" + performAvailabilityCheck + "&token=" + csrfToken + "&domain=" + selectedDomain + "&orderType=" + orderType + appendYears,
        function(data) {
            if (data == 1) {
                jQuery("#cartItemCount").html(((jQuery("#cartItemCount").html() * 1) + 1));
                jQuery(clickedBtn).html('<span class="glyphicon glyphicon-shopping-cart"></span> ' + langAdded);
                jQuery("#btnCheckout").fadeIn();
            } else if (data == 2) {
                jQuery("#modalCheckUnavailable").modal('show');
                jQuery(clickedBtn).html(langUnavailable);
            } else if (data == 3) {
                jQuery("#modalAlreadyInCart").modal('show');
            } else {
                jQuery("#modalAddToCartError").modal('show');
            }
        });

}

function showMoreSuggestions() {
    showCount = 0;
    jQuery("#suggestionResults tbody tr").each(function(index) {
        if (jQuery(this).hasClass('hidden')) {
            if (showCount < 10) {
                jQuery(this).hide().removeClass('hidden').fadeIn();
                showCount++;
            }
        }
    });

    if (!jQuery("#suggestionResults tbody tr").hasClass('hidden')) {
        jQuery("#trNoMoreSuggestions").fadeIn();
        jQuery("#btnMoreSuggestions").fadeOut();
    }
}

function showDomainWarning(id) {
    if (jQuery(".domain-checker-error").is(":visible")) {
        jQuery(".domain-checker-error").hide();
        jQuery(id).removeClass("hidden").show();
    } else {
        if (!jQuery(id).is(":visible")) {
            jQuery(id).hide()
                .removeClass("hidden")
                .fadeIn("fast");
        }
    }
}

function viewWhois(domain) {
    jQuery("#modalWhoisLoader").removeClass('hidden').show();
    jQuery("#modalWhoisBody").hide();
    jQuery("#whoisDomainName").html(domain);
    jQuery("#modalWhois").modal('show');
    jQuery.post("whois.php", "domain=" + domain,
        function(data) {
            jQuery("#modalWhoisBody").html(data);
            jQuery("#modalWhoisLoader").hide();
            jQuery("#modalWhoisBody").show();
        });
}
