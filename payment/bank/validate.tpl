{if !$hasRemoteInput}
    <script>
        var stateNotRequired = true,
            paymentForm = '';

        function validateBankAccountInput(e)
        {
            var newOrExisting = jQuery('input[name="paymethod"]:checked').val(),
                submitButton = jQuery('#btnSubmit'),
                submit = true,
                accountNumber = jQuery('#inputBankAcctNum');

            paymentForm.find('.form-group').removeClass('has-error');
            paymentForm.find('.field-error-msg').hide();

            if (newOrExisting === 'new') {
                var accountHolderName = jQuery('#inputBankAcctHolderName'),
                    bankName = jQuery('#inputBankName'),
                    routingNumber = jQuery('#inputBankRoutingNum');
                if (!accountHolderName.val()) {
                    accountHolderName.showInputError();
                    submit = false;
                }
                if (!bankName.val()) {
                    bankName.showInputError();
                    submit = false;
                }
                if (!routingNumber.val()) {
                    routingNumber.showInputError();
                    submit = false;
                }
                if (!accountNumber.val()) {
                    accountNumber.showInputError();
                    submit = false;
                }
            }
            if (!submit) {
                submitButton.prop('disabled', false).removeClass('disabled')
                    .find('span').toggleClass('hidden');
                e.preventDefault();
            }
        }

        jQuery(document).ready(function() {
            paymentForm = jQuery('#frmPayment');
            paymentForm.off('submit');
            paymentForm.on('submit', validateBankAccountInput);
            jQuery('.paymethod-info input[name="paymethod"]').on('ifChecked', function() {
                if (jQuery(this).val() === 'new') {
                    showNewAccountInputFields();
                } else {
                    hideNewAccountInputFields();
                }
            });

            jQuery('#billingAddressChoice input[name="billingcontact"]').on('ifChecked', function() {
                if (jQuery(this).val() === 'new') {
                    showNewBillingAddressFields();
                } else {
                    hideNewBillingAddressFields();
                }
            });

            paymentForm.find('#inputBankRoutingNum').payment('restrictNumeric');
            paymentForm.find('#inputBankAcctNum').payment('restrictNumeric');
        });
    </script>
    <script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
{else}
    <script>
        jQuery(document).ready(function() {
            jQuery('.paymethod-info input[name="paymethod"]').on('ifChecked', function() {
                if (jQuery(this).val() === 'new') {
                    if (window.location.toString().match(/\?/)) {
                        window.location = window.location + '&ccinfo=new';
                    } else {
                        window.location = window.location + '?ccinfo=new';
                    }

                    return true;
                }
            });
        });
    </script>
{/if}
