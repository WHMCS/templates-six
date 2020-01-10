<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
<h3 style="margin-top:0;">
    {if $editMode}
        {$LANG.paymentMethodsManage.editPaymentMethod}
    {else}
        {$LANG.paymentMethodsManage.addPaymentMethod}
    {/if}
</h3>

<form id="frmManagePaymentMethod" class="form-horizontal frm-credit-card-input" role="form" method="post" action="{if $editMode}{routePath('account-paymentmethods-save', $payMethod->id)}{else}{routePath('account-paymentmethods-add')}{/if}">
    <div class="alert alert-warning text-center gateway-errors assisted-cc-input-feedback hidden">
        {$LANG.paymentMethodsManage.invalidCardDetails}
    </div>

    <div class="form-group">
        <label for="inputPaymentMethodType" class="col-sm-4 control-label">{$LANG.paymentMethods.type}</label>
        <div class="col-sm-8">
            {if $enabledTypes['tokenGateways']}
                {foreach $tokenGateways as $tokenGateway}
                    <label class="radio-inline icheck-label">
                        <input type="radio" class="icheck-button" name="type" value="token_{$tokenGateway}" data-tokenised="true" data-gateway="{$tokenGateway}"{if $editMode && $payMethod->isCreditCard() && $payMethod->gateway_name == $tokenGateway} checked{/if}{if $editMode} disabled{/if}>
                        {$gatewayDisplayNames[$tokenGateway]}
                    </label>
                {/foreach}
            {/if}
            {if $enabledTypes['localCreditCard']}
                <label class="radio-inline icheck-label">
                    <input type="radio" class="icheck-button" name="type" value="localcard"{if ($editMode && $payMethod->isCreditCard() && !$payMethod->isTokenised()) || (!$editMode && $paymentMethodType != 'bankacct')} checked{/if}{if $editMode} disabled{/if}>
                    {$LANG.paymentMethodsManage.creditCard}
                </label>
            {/if}
            {if $enabledTypes['bankAccount']}
                <label class="radio-inline icheck-label">
                    <input type="radio" class="icheck-button" name="type" value="bankacct"{if ($editMode && !$payMethod->isCreditCard()) || ($paymentMethodType == 'bankacct')} checked{/if}{if $editMode} disabled{/if}>
                    {$LANG.paymentMethodsManage.bankAccount}
                </label>
            {/if}
        </div>
    </div>
    <div class="fieldgroup-auxfields{if $remoteUpdate} hidden{/if}">
        <div class="form-group">
            <label for="inputDescription" class="col-sm-4 control-label">{$LANG.paymentMethods.description}</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="inputDescription" name="description" autocomplete="off" value="{$payMethod->description}" style="display:inline-block;width:400px;">
                <span class="text-muted">{$LANG.paymentMethodsManage.optional}</span>
            </div>
        </div>
    </div>
    <div class="fieldgroup-loading hidden">
        <div style="padding:30px;text-align:center;">
            <i class="fas fa-spinner fa-spin"></i>
            {$LANG.pleasewait}
        </div>
    </div>
    <div class="fieldgroup-creditcard{if $editMode && !$payMethod->isCreditCard() || $paymentMethodType == 'bankacct' || $remoteUpdate} hidden{/if}">
        <div class="cc-details">
            <div class="form-group">
                <label for="inputCardNumber" class="col-sm-4 control-label">{$LANG.creditcardcardnumber}</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-6">
                            <input type="tel" class="form-control cc-number-field {$creditCard->getCardType()|strtolower}" id="inputCardNumber" name="ccnumber" autocomplete="cc-number" value="{$creditCard->getMaskedCardNumber()}"{if !$creditCardNumberFieldEnabled} disabled{/if} aria-describedby="cc-type" data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" data-supported-cards="{$supportedCardTypes}">
                        </div>
                    </div>
                    <span class="field-error-msg">{$LANG.paymentMethodsManage.cardNumberNotValid}</span>
                </div>
            </div>
            {if $startDateEnabled}
                <div class="form-group">
                    <label for="inputCardStart" class="col-sm-4 control-label">{$LANG.creditcardcardstart}</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-4">
                                <input type="tel" class="form-control" id="inputCardStart" name="ccstart" autocomplete="off" value="{if $creditCard->getStartDate()}{$creditCard->getStartDate()->format('m / y')}{/if}">
                            </div>
                        </div>
                    </div>
                </div>
            {/if}
            <div class="form-group">
                <label for="inputCardExpiry" class="col-sm-4 control-label">{$LANG.creditcardcardexpires}</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-sm-4">
                            <input type="tel" class="form-control" id="inputCardExpiry" name="ccexpiry" autocomplete="cc-exp" value="{if $creditCard->getExpiryDate()}{$creditCard->getExpiryDate()->format('m / y')}{/if}"{if !$creditCardExpiryFieldEnabled} disabled{/if}>
                        </div>
                    </div>
                    <span class="field-error-msg">{$LANG.paymentMethodsManage.expiryDateNotValid}</span>
                </div>
            </div>
            {if $issueNumberEnabled}
                <div class="form-group">
                    <label for="inputCardIssue" class="col-sm-4 col-xs-12 control-label">{$LANG.creditcardcardissuenum}</label>
                    <div class="col-sm-2 col-xs-4">
                        <input type="tel" class="form-control" id="inputCardIssue" name="ccissuenum" autocomplete="off" value="{$creditCard->getIssueNumber()}">
                    </div>
                </div>
            {/if}
            {if $creditCardCvcFieldEnabled}
                <div class="form-group">
                    <label for="inputCardCvc" class="col-sm-4 col-xs-12 control-label">{$LANG.creditcardcvvnumber}</label>
                    <div class="col-sm-8">
                        <input type="tel" class="form-control input-inline input-inline-100" id="inputCardCvc" name="cardcvv" autocomplete="off">
                        <button id="cvvWhereLink" type="button" class="btn btn-link" data-toggle="popover" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210'>">
                            {$LANG.creditcardcvvwhere}
                        </button>
                        <div class="clearfix"></div>
                        <span class="field-error-msg">{$LANG.paymentMethodsManage.cvcNumberNotValid}</span>
                    </div>
                </div>
            {/if}
        </div>
    </div>
    <div class="fieldgroup-bankaccount{if $remoteUpdate || ($editMode && $payMethod->isCreditCard()) || ($paymentMethodType != 'bankacct' && !$editMode)} hidden{/if}">
        <div class="form-group">
            <label for="inputBankAcctType" class="col-sm-4 control-label">{$LANG.paymentMethodsManage.accountType}</label>
            <div class="col-sm-8">
                <label class="radio-inline icheck-label">
                    <input type="radio" class="icheck-button" name="bankaccttype" id="inputBankAcctType" value="Checking"{if !$bankAccount->getAccountType() || $bankAccount->getAccountType() == 'Checking'} checked{/if}>
                    {$LANG.paymentMethodsManage.checking}
                </label>
                <label class="radio-inline icheck-label">
                    <input type="radio" class="icheck-button" name="bankaccttype" value="Savings"{if $bankAccount->getAccountType() == 'Savings'} checked{/if}>
                    {$LANG.paymentMethodsManage.savings}
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="inputBankAcctHolderName" class="col-sm-4 control-label">{$LANG.paymentMethodsManage.accountHolderName}</label>
            <div class="col-sm-4">
                <input type="tel" class="form-control" id="inputBankAcctHolderName" name="bankacctholdername" autocomplete="off" value="{$bankAccount->getAccountHolderName()}">
                <span class="field-error-msg">{$LANG.paymentMethods.fieldRequired}</span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputBankName" class="col-sm-4 control-label">{$LANG.paymentMethodsManage.bankName}</label>
            <div class="col-sm-4">
                <input type="tel" class="form-control" id="inputBankName" name="bankname" autocomplete="off" value="{$bankAccount->getBankName()}">
                <span class="field-error-msg">{$LANG.paymentMethods.fieldRequired}</span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputBankRoutingNum" class="col-sm-4 control-label">{$LANG.paymentMethodsManage.sortCodeRoutingNumber}</label>
            <div class="col-sm-4">
                <input type="tel" class="form-control" id="inputBankRoutingNum" name="bankroutingnum" autocomplete="off" value="{$bankAccount->getRoutingNumber()}">
                <span class="field-error-msg">{$LANG.paymentMethodsManage.routingNumberNotValid}</span>
            </div>
        </div>
        <div class="form-group">
            <label for="inputBankAcctNum" class="col-sm-4 control-label">{$LANG.paymentMethodsManage.accountNumber}</label>
            <div class="col-sm-4">
                <input type="tel" class="form-control" id="inputBankAcctNum" name="bankacctnum" autocomplete="off" value="{$bankAccount->getAccountNumber()}">
                <span class="field-error-msg">{$LANG.paymentMethodsManage.accountNumberNotValid}</span>
            </div>
        </div>
    </div>
    <div class="fieldgroup-auxfields{if $remoteUpdate} hidden{/if}">
        <div class="form-group">
            <label for="inputBillingAddress" class="col-sm-4 col-xs-12 control-label">{$LANG.billingAddress}</label>
            <div class="col-sm-8">
                <div id="billingContactsContainer">
                    {include file="$template/account-paymentmethods-billing-contacts.tpl"}
                </div>
                <br>
                <a href="#" class="btn btn-default btn-sm" data-toggle="modal" data-target="#modalBillingAddress">{$LANG.paymentMethodsManage.addNewAddress}</a>
            </div>
        </div>
        <div class="form-group submit-container">
            <div class="col-sm-8 col-sm-offset-4">
                <button type="submit" name="submit" id="btnSubmit" class="btn btn-primary">{$LANG.clientareasavechanges}</button>
                <a href="{routePath('account-paymentmethods')}" class="btn btn-default">{$LANG.cancel}</a>
            </div>
        </div>
    </div>
    <input type="hidden" name="billing_name" id="inputBillingName" value="">
    <input type="hidden" name="billing_address_1" id="inputBillingAddress1" value="">
    <input type="hidden" name="billing_address_2" id="inputBillingAddress2" value="">
    <input type="hidden" name="billing_city" id="inputBillingCity" value="">
    <input type="hidden" name="billing_state" id="inputBillingState" value="">
    <input type="hidden" name="billing_postcode" id="inputBillingPostcode" value="">
    <input type="hidden" name="billing_country" id="inputBillingCountry" value="">
</form>

<div class="fieldgroup-remoteinput {if ($editMode && !$remoteUpdate) || !$editMode}hidden{/if}">
    {if $remoteUpdate}
        <div id="tokenGatewayRemoteUpdateOutput" class="text-center">{$remoteUpdate}</div>
    {else}
        <div id="tokenGatewayRemoteInputOutput" class="text-center" align="center"></div>
        <div class="text-center">
            <iframe name="ccframe" class="auth3d-area" width="90%" height="600" scrolling="auto" src="about:blank"></iframe>
        </div>
    {/if}
</div>

<div class="modal fade" id="modalBillingAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form id="billingContactForm" action="{routePath('account-paymentmethods-billing-contacts-create')}" data-role="json-form">
                <input type="hidden" name="token" value="{$csrfToken}" />
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">{$LANG.paymentMethodsManage.addNewBillingAddress}</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="inputFirstName" class="control-label">{$LANG.clientareafirstname}</label>
                                <input type="text" name="firstname" id="inputFirstName" value="{$contactfirstname}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputLastName" class="control-label">{$LANG.clientarealastname}</label>
                                <input type="text" name="lastname" id="inputLastName" value="{$contactlastname}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputCompanyName"
                                       class="control-label">{$LANG.clientareacompanyname}</label>
                                <input type="text" name="companyname" id="inputCompanyName"
                                       value="{$contactcompanyname}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputPhone" class="control-label">{$LANG.clientareaphonenumber}</label>
                                <input type="tel" name="phonenumber" id="inputPhone" value="{$contactphonenumber}"
                                       class="form-control">
                            </div>

                            {if $showTaxIdField}
                                <div class="form-group">
                                    <label for="inputTaxId" class="control-label">{lang key=$taxIdLabel}</label>
                                    <input type="text" name="tax_id" id="inputTaxId" class="form-control"
                                           value="{$contactTaxId}">
                                </div>
                            {/if}

                        </div>
                        <div class="col-sm-6">

                            <div class="form-group">
                                <label for="inputAddress1" class="control-label">{$LANG.clientareaaddress1}</label>
                                <input type="text" name="address1" id="inputAddress1" value="{$contactaddress1}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputAddress2" class="control-label">{$LANG.clientareaaddress2}</label>
                                <input type="text" name="address2" id="inputAddress2" value="{$contactaddress2}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputCity" class="control-label">{$LANG.clientareacity}</label>
                                <input type="text" name="city" id="inputCity" value="{$contactcity}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputState" class="control-label">{$LANG.clientareastate}</label>
                                <input type="text" name="state" id="inputState" value="{$contactstate}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="inputPostcode" class="control-label">{$LANG.clientareapostcode}</label>
                                <input type="text" name="postcode" id="inputPostcode" value="{$contactpostcode}"
                                       class="form-control">
                            </div>

                            <div class="form-group">
                                <label class="control-label" for="inputCountry">{$LANG.clientareacountry}</label>
                                <select class="form-control" name="country" id="inputCountry">
                                    {foreach $countries as $countryCode => $countryName}
                                        <option value="{$countryCode}"{if ($countryCode == $clientCountry)} selected="selected"{/if}>
                                            {$countryName}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.paymentMethods.close}</button>
                    <button type="submit" class="btn btn-primary">{$LANG.paymentMethods.saveChanges}</button>
                </div>
            </form>
        </div>
    </div>
</div>

<input type="hidden" name="paymentmethod" id="inputPaymentMethod" value="">
<div id="tokenGatewayAssistedOutput"></div>

<script type="text/javascript" src="{$BASE_PATH_JS}/jquery.payment.js"></script>
<script>
jQuery(document).ready(function() {
    var ccNumberFieldEnabled = '{$creditCardNumberFieldEnabled}';
    var ccExpiryFieldEnabled = '{$creditCardExpiryFieldEnabled}';
    var ccCvcFieldEnabled = '{$creditCardCvcFieldEnabled}';

    var ccForm = jQuery('.frm-credit-card-input');

    ccForm.find('#inputCardNumber').payment('formatCardNumber');
    ccForm.find('#inputCardStart').payment('formatCardExpiry');
    ccForm.find('#inputCardExpiry').payment('formatCardExpiry');
    ccForm.find('#inputCardCvc').payment('formatCardCVC');
    ccForm.find('#inputCardIssue').payment('restrictNumeric');
    ccForm.find('#inputBankRoutingNum').payment('restrictNumeric');
    ccForm.find('#inputBankAcctNum').payment('restrictNumeric');

    var reloadBillingContacts = function (selectContactId) {
        WHMCS.http.jqClient.get({
            url: "{routePath('account-paymentmethods-billing-contacts', $payMethod->id)}",
            data: {
                'contact_id': selectContactId ? selectContactId : 0
            },
            success: function(response) {
                jQuery('#billingContactsContainer').html(response);
            }
        });
    };

    jQuery(document).on('click', '.frm-credit-card-input button[type="submit"]', function(e) {
        ccForm.find('.form-group').removeClass('has-error');
        ccForm.find('.field-error-msg').hide();

        var checkedInput = jQuery('input[name="type"]:checked', ccForm);

        if (checkedInput.val() === 'bankacct') {
            if (!jQuery('#inputBankAcctHolderName').val()) {
                jQuery('#inputBankAcctHolderName').showInputError();
                e.preventDefault();
            }
            if (!jQuery('#inputBankName').val()) {
                jQuery('#inputBankName').showInputError();
                e.preventDefault();
            }
            if (!jQuery('#inputBankRoutingNum').val()) {
                jQuery('#inputBankRoutingNum').showInputError();
                e.preventDefault();
            }
            if (!jQuery('#inputBankAcctNum').val()) {
                jQuery('#inputBankAcctNum').showInputError();
                e.preventDefault();
            }
        } else if (checkedInput.val() === 'localcard') {
            var cardType = $.payment.cardType(ccForm.find('#inputCardNumber').val()),
                cardNumber = ccForm.find('#inputCardNumber');
            if (
                ccNumberFieldEnabled
                && (!$.payment.validateCardNumber(cardNumber.val()) || cardNumber.hasClass('unsupported'))
            ) {
                var error = cardNumber.data('message-invalid');
                if (cardNumber.hasClass('unsupported')) {
                    error = cardNumber.data('message-unsupported');
                }
                ccForm.find('#inputCardNumber').setInputError(error).showInputError();
                e.preventDefault();
            }
            if (ccExpiryFieldEnabled && !$.payment.validateCardExpiry(ccForm.find('#inputCardExpiry').payment('cardExpiryVal'))) {
                ccForm.find('#inputCardExpiry').showInputError();
                e.preventDefault();
            }
            if (ccCvcFieldEnabled && !$.payment.validateCardCVC(ccForm.find('#inputCardCvc').val(), cardType)) {
                ccForm.find('#inputCardCvc').showInputError();
                e.preventDefault();
            }
        }
    });

    jQuery('input[name="type"]').on('ifChecked', function(e) {
        jQuery('.fieldgroup-creditcard').hide();
        jQuery('.fieldgroup-bankaccount').hide();
        jQuery('.fieldgroup-remoteinput').hide();
        jQuery('.fieldgroup-auxfields').hide();
        jQuery('.fieldgroup-loading').removeClass('hidden').show();
        jQuery('#tokenGatewayAssistedOutput').html('');
        if (jQuery(this).data('tokenised') === true) {
            jQuery('#inputPaymentMethod').val(jQuery(this).data('gateway'));
            WHMCS.http.jqClient.jsonPost({
                url: "{routePath('account-paymentmethods-inittoken')}",
                data: 'gateway=' + jQuery(this).data('gateway'),
                success: function(response) {
                    jQuery('.fieldgroup-loading').hide();
                    if (response.remoteInputForm) {
                        jQuery('#tokenGatewayRemoteInputOutput').html(response.remoteInputForm);
                        jQuery('#tokenGatewayRemoteInputOutput').find('form:first').attr('target', 'ccframe');
                        setTimeout("autoSubmitFormByContainer('tokenGatewayRemoteInputOutput')", 1000);
                        jQuery('.fieldgroup-remoteinput').removeClass('hidden').show();
                    } else if (response.assistedOutput) {
                        jQuery('.fieldgroup-creditcard').removeClass('hidden').show('fast', function() {
                            jQuery('#tokenGatewayAssistedOutput').html(response.assistedOutput);
                        });
                        jQuery('.fieldgroup-auxfields').show();
                    } else {
                        jQuery('.fieldgroup-creditcard').removeClass('hidden').show();
                        jQuery('.fieldgroup-auxfields').show();
                    }
                },
            });
        } else if (jQuery(this).val() === 'bankacct') {
            jQuery('.fieldgroup-loading').hide();
            jQuery('.fieldgroup-bankaccount').removeClass('hidden').show();
            jQuery('.fieldgroup-auxfields').show();
        } else {
            jQuery('.fieldgroup-loading').hide();
            jQuery('.fieldgroup-creditcard').removeClass('hidden').show();
            jQuery('.fieldgroup-auxfields').show();
        }
    });
    jQuery('input[name="billingcontact"]').on('ifChecked', function(e) {
        var contact = jQuery('.billing-contact-' + jQuery(this).val());
        jQuery('#inputBillingName').val(contact.find('.name').html());
        jQuery('#inputBillingAddress1').val(contact.find('.address1').html());
        jQuery('#inputBillingAddress2').val(contact.find('.address2').html());
        jQuery('#inputBillingCity').val(contact.find('.city').html());
        jQuery('#inputBillingState').val(contact.find('.state').html());
        jQuery('#inputBillingPostcode').val(contact.find('.postcode').html());
        jQuery('#inputBillingCountry').val(contact.find('.country').html());
    });

    if (jQuery('input[name="type"]:checked', ccForm).length === 0) {
        jQuery('input[name="type"]', ccForm).first().parents('label').trigger('click');
    }

    jQuery('#billingContactForm')
        .data('on-success', function(data) {
            jQuery('#modalBillingAddress').modal('hide');
            reloadBillingContacts(data.id);
        });
});
</script>
