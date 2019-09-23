{if $showRemoteInput}
    <div id="frmRemoteCardProcess" class="text-center" align="center">
        {$remoteInput}
        <iframe name="ccframe" class="auth3d-area" width="90%" height="600" scrolling="auto" src="about:blank"></iframe>
    </div>

    <script language="javascript">
        jQuery("#frmRemoteCardProcess").find("form:first").attr('target', 'ccframe');
        setTimeout("autoSubmitFormByContainer('frmRemoteCardProcess')", 1000);
    </script>
{else}
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
                        .find('span').toggleClass('hidden');
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
                        window.location = window.location + '&new=1';
                        return true;
                    }
                });
            });
        </script>
    {/if}
    <form id="frmPayment" method="post" action="creditcard.php" class="form-horizontal" role="form">
        <input type="hidden" name="action" value="submit" />
        <input type="hidden" name="invoiceid" value="{$invoiceid}" />

        <div class="row">
            <div class="col-md-7">

                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}

                <div class="alert alert-danger text-center gateway-errors hidden"></div>

                <div class="form-group">
                    <label class="col-sm-4 control-label">{$LANG.paymentmethod}</label>
                    <div class="col-sm-8">
                        {if count($existingCards) > 0}
                            <div class="three-column-grid">
                                {foreach $existingCards as $cardInfo}
                                    {assign "payMethodExpired" 0}
                                    {assign "expiryDate" ""}
                                    {assign "payMethod" $cardInfo.payMethod nocache}
                                    {if $payMethod->payment->isExpired()}
                                        {assign "payMethodExpired" 1}
                                    {/if}
                                    {if $payMethod->payment->getExpiryDate()}
                                        {assign "expiryDate" $payMethod->payment->getExpiryDate()->format('m/Y')}
                                    {/if}

                                    <div class="paymethod-info" data-paymethod-id="{$cardInfo.paymethodid}">
                                        <input
                                            id="existingCard{$cardInfo.paymethodid}"
                                            type="radio"
                                            name="ccinfo"
                                            class="existing-card icheck-button"
                                            data-billing-contact-id="{$cardInfo.billingcontactid}"
                                            {if $cardOnFile && !$payMethodExpired && $ccinfo eq $cardInfo.paymethodid}
                                                {assign "preselectedBillingContactId" {$cardInfo.billingcontactid}}
                                                checked="checked" data-loaded-paymethod="true"
                                            {elseif ($cardOnFile && $payMethodExpired) || !$cardOnFile}
                                                disabled="disabled"
                                            {/if}
                                            {if !$hasRemoteInput}onclick="hideNewCardInputFields();"{/if}
                                            value="{$cardInfo.paymethodid}"
                                        >
                                    </div>
                                    <div class="paymethod-info" data-paymethod-id="{$cardInfo.paymethodid}">
                                        <label for="existingCard{$cardInfo.paymethodid}">
                                            <i class="{$payMethod->getFontAwesomeIcon()}"></i>
                                        </label>
                                    </div>
                                    <div class="paymethod-info" data-paymethod-id="{$cardInfo.paymethodid}">
                                        <label for="existingCard{$cardInfo.paymethodid}">
                                            {$payMethod->payment->getDisplayName()}
                                        </label>
                                    </div>
                                    <div class="paymethod-info" data-paymethod-id="{$cardInfo.paymethodid}">
                                        <label for="existingCard{$cardInfo.paymethodid}">
                                            {$payMethod->getDescription()}
                                        </label>
                                    </div>
                                    <div class="paymethod-info" data-paymethod-id="{$cardInfo.paymethodid}">
                                        <label for="existingCard{$cardInfo.paymethodid}">
                                            {$expiryDate}
                                            {if $payMethodExpired}<br><small>{$LANG.clientareaexpired}</small>{/if}
                                        </label>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                        <div class="paymethod-info">
                            <label>
                                <input id="newCCInfo" type="radio" class="icheck-button" name="ccinfo" value="new" {if $ccinfo eq "new" || !$cardOnFile} checked{/if} /> {$LANG.creditcardenternewcard}</label>
                            </label>
                        </div>
                    </div>
                </div>

                {if !$hasRemoteInput}
                    <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                        <label for="inputCardNumber" class="col-sm-4 control-label">{$LANG.creditcardcardnumber}</label>
                        <div class="col-sm-7">
                            <input type="tel" name="ccnumber" id="inputCardNumber" size="30" value="{if $ccnumber}{$ccnumber}{/if}" autocomplete="off" class="form-control newccinfo cc-number-field" data-message-unsupported="{lang key='paymentMethodsManage.unsupportedCardType'}" data-message-invalid="{lang key='paymentMethodsManage.cardNumberNotValid'}" data-supported-cards="{$supportedCardTypes}"/>
                            <span class="field-error-msg"></span>
                        </div>
                    </div>
                    {if $showccissuestart}
                        <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                            <label for="inputCardStart" class="col-sm-4 control-label">{$LANG.creditcardcardstart}</label>
                            <div class="col-sm-8">
                                <input type="tel" name="ccstartdate" id="inputCardStart" class="form-control field input-inline input-inline-100" placeholder="MM / YY ({$LANG.creditcardcardstart})">
                            </div>
                        </div>
                    {/if}
                    <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                        <label for="inputCardExpiry" class="col-sm-4 control-label">{$LANG.creditcardcardexpires}</label>
                        <div class="col-sm-8">
                            <input type="tel" name="ccexpirydate" id="inputCardExpiry" class="form-control field input-inline input-inline-100" placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" autocomplete="cc-exp">
                            <span class="field-error-msg">{lang key="paymentMethodsManage.expiryDateNotValid"}</span>
                        </div>
                    </div>
                    {if $showccissuestart}
                        <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                            <label for="inputIssueNum" class="col-sm-4 control-label">{$LANG.creditcardcardissuenum}</label>
                            <div class="col-xs-2">
                                <input type="number" name="ccissuenum" id="inputIssueNum" value="{$ccissuenum}" class="form-control  input-inline input-inline-100" />
                            </div>
                        </div>
                    {/if}
                    <div class="form-group">
                        <label for="cctype" class="col-sm-4 control-label">{$LANG.creditcardcvvnumber}</label>
                        <div class="col-sm-7">
                            <input type="tel" name="cccvv" id="inputCardCvv" value="{$cccvv}" autocomplete="off" class="form-control input-inline input-inline-100" />
                            <button id="cvvWhereLink" type="button" class="btn btn-link" data-toggle="popover" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210'>">
                                {$LANG.creditcardcvvwhere}
                            </button>
                            <br>
                            <span class="field-error-msg">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
                        </div>
                    </div>

                    <div class="form-group" id="billingAddressChoice" {if !$addingNewCard}style="display: none"{/if}>
                        <label for="cctype" class="col-sm-4 control-label">{$LANG.billingAddress}</label>
                        <div class="col-sm-8">
                            <label class="radio-inline icheck-label billing-contact-0">
                                <input
                                    type="radio"
                                    class="icheck-button"
                                    name="billingcontact"
                                    value="0"
                                    {if !$billingcontact || $billingcontact != $client->billingContactId} checked{/if}
                                >

                                <strong class="name">{$client->fullName}</strong>
                                <span class="address1">{$client->address1}</span>,
                                {if $client->address2}<span class="address2">{$client->address2}</span>,{/if}
                                <span class="city">{$client->city}</span>,
                                <span class="state">{$client->state}</span>,
                                <span class="postcode">{$client->postcode}</span>,
                                <span class="country">{$client->country}</span>
                            </label>
                            <br>
                            {foreach $client->contacts()->orderBy('firstname', 'asc')->orderBy('lastname', 'asc')->get() as $contact}
                                <label class="radio-inline icheck-label billing-contact-{$contact->id}">
                                    <input
                                        type="radio"
                                        class="icheck-button"
                                        name="billingcontact"
                                        value="{$contact->id}"
                                        {if $billingcontact == $contact->id || $contact->id == $client->billingContactId} checked{/if}
                                    >

                                    <strong class="name">{$contact->fullName}</strong>
                                    <span class="address1">{$contact->address1}</span>,
                                    {if $contact->address2}<span class="address2">{$contact->address2}</span>,{/if}
                                    <span class="city">{$contact->city}</span>,
                                    <span class="state">{$contact->state}</span>,
                                    <span class="postcode">{$contact->postcode}</span>,
                                    <span class="country">{$contact->country}</span>
                                </label>
                                <br>
                            {/foreach}
                            <label class="radio-inline icheck-label">
                                <input
                                    type="radio"
                                    class="icheck-button"
                                    name="billingcontact"
                                    value="new"
                                    {if $billingcontact == 'new'} checked{/if}
                                >
                                {$LANG.paymentMethodsManage.addNewBillingAddress}
                            </label>
                        </div>
                    </div>
                    <div id="newBillingAddress" {if !$userDetailsValidationError && $billingcontact != 'new'} style="display: none"{/if}>
                        <div class="form-group cc-billing-address">
                            <label for="inputFirstName" class="col-sm-4 control-label">{$LANG.clientareafirstname}</label>
                            <div class="col-sm-6">
                                <input type="text" name="firstname" id="inputFirstName" value="{$firstname}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputLastName" class="col-sm-4 control-label">{$LANG.clientarealastname}</label>
                            <div class="col-sm-6">
                                <input type="text" name="lastname" id="inputLastName" value="{$lastname}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputAddress1" class="col-sm-4 control-label">{$LANG.clientareaaddress1}</label>
                            <div class="col-sm-6">
                                <input type="text" name="address1" id="inputAddress1" value="{$address1}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputAddress2" class="col-sm-4 control-label">{$LANG.clientareaaddress2}</label>
                            <div class="col-sm-6">
                                <input type="text" name="address2" id="inputAddress2" value="{$address2}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputCity" class="col-sm-4 control-label">{$LANG.clientareacity}</label>
                            <div class="col-sm-6">
                                <input type="text" name="city" id="inputCity" value="{$city}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputState" class="col-sm-4 control-label">{$LANG.clientareastate}</label>
                            <div class="col-sm-6">
                                <input type="text" name="state" id="inputState" value="{$state}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputPostcode" class="col-sm-4 control-label">{$LANG.clientareapostcode}</label>
                            <div class="col-sm-6">
                                <input type="text" name="postcode" id="inputPostcode" value="{$postcode}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputCountry" class="col-sm-4 control-label">{$LANG.clientareacountry}</label>
                            <div class="col-sm-6">
                                {$countriesdropdown}
                            </div>
                        </div>
                        <div class="form-group cc-billing-address">
                            <label for="inputPhone" class="col-sm-4 control-label">{$LANG.clientareaphonenumber}</label>
                            <div class="col-sm-6">
                                <input type="text" name="phonenumber" id="inputPhone" value="{$phonenumber}" class="form-control" />
                            </div>
                        </div>
                    </div>
                    {if $allowClientsToRemoveCards}
                        <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                            <div class="col-sm-offset-4 col-sm-8">
                                <input type="hidden" name="nostore" value="1">
                                <input type="checkbox" class="toggle-switch-success" data-size="mini" checked="checked" name="nostore" id="inputNoStore" value="0" data-on-text="{lang key='yes'}" data-off-text="{lang key='no'}">
                                <label class="checkbox-inline no-padding" for="inputNoStore">
                                    &nbsp;&nbsp;
                                    {$LANG.creditCardStore}
                                </label>

                            </div>
                        </div>
                    {/if}
                    <div id="inputDescriptionContainer" class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                        <label for="inputDescription" class="col-sm-4 control-label">{$LANG.paymentMethods.cardDescription}</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="inputDescription" name="ccdescription" autocomplete="off" value="" placeholder="{lang key='paymentMethods.descriptionInput'} {$LANG.paymentMethodsManage.optional}" />
                        </div>
                    </div>
                {/if}
                <div id="btnSubmitContainer" class="form-group submit-container">
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg margin-top-5" id="btnSubmit" value="{$LANG.submitpayment}">
                            <span class="pay-text">{$LANG.submitpayment}</span>
                            <span class="click-text hidden">{$LANG.pleasewait}</span>
                        </button>
                    </div>
                </div>

            </div>
            <div class="col-md-5">

                <div id="invoiceIdSummary" class="invoice-summary">
                    <h2 class="text-center">
                        {$LANG.invoicenumber}{if $invoicenum}{$invoicenum}{else}{$invoiceid}{/if}
                    </h2>
                    <div class="invoice-summary-table">
                    <table class="table table-condensed">
                        <tr>
                            <td class="text-center"><strong>{$LANG.invoicesdescription}</strong></td>
                            <td width="150" class="text-center"><strong>{$LANG.invoicesamount}</strong></td>
                        </tr>
                        {foreach $invoiceitems as $item}
                            <tr>
                                <td>{$item.description}</td>
                                <td class="text-center">{$item.amount}</td>
                            </tr>
                        {/foreach}
                        <tr>
                            <td class="total-row text-right">{$LANG.invoicessubtotal}</td>
                            <td class="total-row text-center">{$invoice.subtotal}</td>
                        </tr>
                        {if $invoice.taxrate}
                            <tr>
                                <td class="total-row text-right">{$invoice.taxrate}% {$invoice.taxname}</td>
                                <td class="total-row text-center">{$invoice.tax}</td>
                            </tr>
                        {/if}
                        {if $invoice.taxrate2}
                            <tr>
                                <td class="total-row text-right">{$invoice.taxrate2}% {$invoice.taxname2}</td>
                                <td class="total-row text-center">{$invoice.tax2}</td>
                            </tr>
                        {/if}
                        <tr>
                            <td class="total-row text-right">{$LANG.invoicescredit}</td>
                            <td class="total-row text-center">{$invoice.credit}</td>
                        </tr>
                        <tr>
                            <td class="total-row text-right">{$LANG.invoicestotaldue}</td>
                            <td class="total-row text-center">{$invoice.total}</td>
                        </tr>
                    </table>
                    </div>
                    <p class="text-center">
                        {$LANG.paymentstodate}: <strong>{$invoice.amountpaid}</strong><br />
                        {$LANG.balancedue}: <strong>{$balance}</strong>
                    </p>
                </div>

            </div>
        </div>

        {if $servedOverSsl}
            <div class="alert alert-warning" role="alert">
                <i class="fas fa-lock"></i> &nbsp; {$LANG.creditcardsecuritynotice}
            </div>
        {/if}

    </form>
{/if}
