{if !$hasRemoteInput}
    <script>
        var stateNotRequired = true,
            ccForm = '';

        function validateCreditCardInput(e)
        {
            var newOrExisting = jQuery('input[name="ccinfo"]:checked').val(),
                submitButton = jQuery('#btnSubmit'),
                cardType = null,
                submit = true,
                cardNumber = jQuery('#inputCardNumber');

            ccForm.find('.form-group').removeClass('has-error');
            ccForm.find('.field-error-msg').hide();

            if (newOrExisting === 'new') {
                cardType = jQuery.payment.cardType(ccForm.find('#inputCardNumber').val());
                if (!jQuery.payment.validateCardNumber(ccForm.find('#inputCardNumber').val()) || cardNumber.hasClass('unsupported')) {
                    var error = cardNumber.data('message-invalid');
                    if (cardNumber.hasClass('unsupported')) {
                        error = cardNumber.data('message-unsupported');
                    }
                    ccForm.find('#inputCardNumber').setInputError(error).showInputError();
                    submit = false;
                }
                if (
                    !jQuery.payment.validateCardExpiry(
                        ccForm.find('#inputCardExpiry').payment('cardExpiryVal')
                    )
                ) {
                    ccForm.find('#inputCardExpiry').showInputError();
                    submit = false;
                }
            }
            if (!jQuery.payment.validateCardCVC(ccForm.find('#inputCardCvv').val(), cardType)) {
                ccForm.find('#inputCardCvv').showInputError();
                submit = false;
            }
            if (!submit) {
                submitButton.prop('disabled', false).removeClass('disabled')
                    .find('span').toggle();
                e.preventDefault();
            }
        }

        jQuery(document).ready(function() {
            ccForm = jQuery('#frmPayment');
            ccForm.on('submit', validateCreditCardInput);
            jQuery('.paymethod-info input[name="ccinfo"]').on('ifChecked', function() {
                if (jQuery(this).val() === 'new') {
                    showNewCardInputFields();
                } else {
                    hideNewCardInputFields();
                }
            });

            jQuery('#billingAddressChoice input[name="billingcontact"]').on('ifChecked', function() {
                if (jQuery(this).val() === 'new') {
                    showNewBillingAddressFields();
                } else {
                    hideNewBillingAddressFields();
                }
            });

            ccForm.find('#inputCardNumber').payment('formatCardNumber');
            ccForm.find('#inputCardStart').payment('formatCardExpiry');
            ccForm.find('#inputCardExpiry').payment('formatCardExpiry');
            ccForm.find('#inputCardCvv').payment('formatCardCVC');
            ccForm.find('#ccissuenum').payment('restrictNumeric');
        });
    </script>
    <script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
{else}
    <script>
        jQuery(document).ready(function() {
            jQuery('.paymethod-info input[name="ccinfo"]').on('ifChecked', function() {
                if (jQuery(this).val() === 'new') {
                    var route = '{$newCardRoute}';
                    var delimiter = '?';
                    if (route.indexOf('?') !== -1) {
                        delimiter = '&';
                    }
                    window.location = route + delimiter + 'ccinfo=new';
                    return true;
                }
            });
        });
    </script>
{/if}
