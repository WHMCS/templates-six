{if $remotecode}

    <div id="frmRemoteCardProcess" class="text-center" align="center">

        {$remotecode}

        <iframe name="ccframe" class="auth3d-area" width="90%" height="600" scrolling="auto" src="about:blank"></iframe>

    </div>

    <script language="javascript">
        jQuery("#frmRemoteCardProcess").find("form:first").attr('target', 'ccframe');
        setTimeout("autoSubmitFormByContainer('frmRemoteCardProcess')", 1000);
    </script>

{else}

    <script>
        var stateNotRequired = true;
    </script>
    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>
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
                    <div class="col-sm-8 col-sm-offset-4">
                        <div class="radio">
                            <label>
                                <input type="radio" name="ccinfo" value="new" onclick="showNewCardInputFields()"{if $ccinfo eq "new" || !$cardOnFile} checked{/if} /> {$LANG.creditcardenternewcard}</label>
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="ccinfo" value="useexisting" onclick="hideNewCardInputFields()" {if $cardOnFile && $ccinfo neq "new"}checked{elseif !$cardOnFile}disabled{/if} /> {$LANG.creditcarduseexisting}{if $cardOnFile} ({$existingCardType}-{$existingCardLastFour}){/if}
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group{if $userDetailsValidationError} hidden{/if}" id="billingAddressSummary">
                    <label for="cctype" class="col-sm-4 control-label">{$LANG.billingAddress}</label>
                    <div class="col-sm-6">
                        {if $companyname}{$companyname}{else}{$firstname} {$lastname}{/if} <button type="button" id="btnEditBillingAddress" onclick="editBillingAddress()" class="btn btn-default btn-sm"{if $cardOnFile} disabled="disabled"{/if}><i class="fa fa-edit"></i> {$LANG.change}</button><br />
                        {$address1}{if $address2}, {$address2}{/if}<br />
                        {$city}, {$state}, {$postcode}<br />
                        {$countryname}
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputFirstName" class="col-sm-4 control-label">{$LANG.clientareafirstname}</label>
                    <div class="col-sm-6">
                        <input type="text" name="firstname" id="inputFirstName" value="{$firstname}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputLastName" class="col-sm-4 control-label">{$LANG.clientarealastname}</label>
                    <div class="col-sm-6">
                        <input type="text" name="lastname" id="inputLastName" value="{$lastname}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputAddress1" class="col-sm-4 control-label">{$LANG.clientareaaddress1}</label>
                    <div class="col-sm-6">
                        <input type="text" name="address1" id="inputAddress1" value="{$address1}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputAddress2" class="col-sm-4 control-label">{$LANG.clientareaaddress2}</label>
                    <div class="col-sm-6">
                        <input type="text" name="address2" id="inputAddress2" value="{$address2}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputCity" class="col-sm-4 control-label">{$LANG.clientareacity}</label>
                    <div class="col-sm-6">
                        <input type="text" name="city" id="inputCity" value="{$city}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputState" class="col-sm-4 control-label">{$LANG.clientareastate}</label>
                    <div class="col-sm-6">
                        <input type="text" name="state" id="inputState" value="{$state}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputPostcode" class="col-sm-4 control-label">{$LANG.clientareapostcode}</label>
                    <div class="col-sm-6">
                        <input type="text" name="postcode" id="inputPostcode" value="{$postcode}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputCountry" class="col-sm-4 control-label">{$LANG.clientareacountry}</label>
                    <div class="col-sm-6">
                        {$countriesdropdown}
                    </div>
                </div>
                <div class="form-group cc-billing-address{if !$userDetailsValidationError} hidden{/if}">
                    <label for="inputPhone" class="col-sm-4 control-label">{$LANG.clientareaphonenumber}</label>
                    <div class="col-sm-6">
                        <input type="text" name="phonenumber" id="inputPhone" value="{$phonenumber}" class="form-control" />
                    </div>
                </div>
                <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                    <label for="cctype" class="col-sm-4 control-label">{$LANG.creditcardcardtype}</label>
                    <div class="col-sm-5">
                        <select name="cctype" id="cctype" class="form-control newccinfo">
                            {foreach from=$acceptedcctypes item=type}
                                <option{if $cctype eq $type} selected{/if}>
                                    {$type}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                    <label for="inputCardNumber" class="col-sm-4 control-label">{$LANG.creditcardcardnumber}</label>
                    <div class="col-sm-7">
                        <input type="tel" name="ccnumber" id="inputCardNumber" size="30" value="{if $ccnumber}{$ccnumber}{/if}" autocomplete="off" class="form-control newccinfo" />
                    </div>
                </div>
                {if $showccissuestart}
                    <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                        <label for="inputCardStart" class="col-sm-4 control-label">{$LANG.creditcardcardstart}</label>
                        <div class="col-sm-8">
                            <select name="ccstartmonth" id="inputCardStart" class="form-control select-inline">
                                {foreach from=$months item=month}
                                    <option{if $ccstartmonth eq $month} selected{/if}>{$month}</option>
                                {/foreach}
                            </select>
                            <select name="ccstartyear" id="inputCardStartYear" class="form-control select-inline">
                                {foreach from=$startyears item=year}
                                    <option{if $ccstartyear eq $year} selected{/if}>{$year}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                {/if}
                <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                    <label for="inputCardExpiry" class="col-sm-4 control-label">{$LANG.creditcardcardexpires}</label>
                    <div class="col-sm-8">
                        <select name="ccexpirymonth" id="inputCardExpiry" class="form-control select-inline">
                            {foreach from=$months item=month}
                                <option{if $ccexpirymonth eq $month} selected{/if}>{$month}</option>
                            {/foreach}
                        </select>
                        <select name="ccexpiryyear" id="inputCardExpiryYear" class="form-control select-inline">
                            {foreach from=$expiryyears item=year}
                                <option{if $ccexpiryyear eq $year} selected{/if}>{$year}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                {if $showccissuestart}
                    <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                        <label for="inputIssueNum" class="col-sm-4 control-label">{$LANG.creditcardcardissuenum}</label>
                        <div class="col-xs-2">
                            <input type="number" name="ccissuenum" id="inputIssueNum" value="{$ccissuenum}" class="form-control input-" />
                        </div>
                    </div>
                {/if}
                <div class="form-group">
                    <label for="cctype" class="col-sm-4 control-label">{$LANG.creditcardcvvnumber}</label>
                    <div class="col-sm-7">
                        <input type="number" name="cccvv" id="inputCardCvv" value="{$cccvv}" autocomplete="off" class="form-control input-inline input-inline-100" />
                        <button type="button" class="btn btn-link" data-toggle="popover" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210' />">
                            {$LANG.creditcardcvvwhere}
                        </button>
                    </div>
                </div>

                {if $shownostore}
                    <div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
                        <div class="col-sm-offset-4 col-sm-8">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="nostore" id="inputNoStore"> {$LANG.creditcardnostore}
                                </label>
                            </div>
                        </div>
                    </div>
                {/if}
                <div class="form-group">
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg" id="btnSubmit" value="{$LANG.submitpayment}">
                            <span class="pay-text">{$LANG.submitpayment}</span>
                            <span class="click-text hidden">{$LANG.pleasewait}</span>
                        </button>
                    </div>
                </div>

            </div>
            <div class="col-md-5">

                <div id="invoiceIdSummary" class="invoice-summary">
                    <h2 class="text-center">{$LANG.invoicenumber}{$invoiceid}</h2>
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

        <div class="alert alert-warning" role="alert">
            <i class="fa fa-lock"></i> &nbsp; {$LANG.creditcardsecuritynotice}
        </div>

    </form>

{/if}
