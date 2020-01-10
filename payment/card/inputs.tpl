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
            <input type="tel" name="ccstartdate" id="inputCardStart" value="{$ccstartdate}" class="form-control field input-inline input-inline-100" placeholder="MM / YY ({$LANG.creditcardcardstart})">
        </div>
    </div>
{/if}
<div class="form-group cc-details{if !$addingNewCard} hidden{/if}">
    <label for="inputCardExpiry" class="col-sm-4 control-label">{$LANG.creditcardcardexpires}</label>
    <div class="col-sm-8">
        <input type="tel" name="ccexpirydate" id="inputCardExpiry" value="{$ccexpirydate}" class="form-control field input-inline input-inline-100" placeholder="MM / YY{if $showccissuestart} ({$LANG.creditcardcardexpires}){/if}" autocomplete="cc-exp">
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
    <label for="inputCardCvv" class="col-sm-4 control-label">{$LANG.creditcardcvvnumber}</label>
    <div class="col-sm-7">
        <input type="tel" name="cccvv" id="inputCardCvv" value="{$cccvv}" autocomplete="off" class="form-control input-inline input-inline-100" />
        <button id="cvvWhereLink" type="button" class="btn btn-link" data-toggle="popover" data-content="<img src='{$BASE_PATH_IMG}/ccv.gif' width='210'>">
            {$LANG.creditcardcvvwhere}
        </button>
        <br>
        <span class="field-error-msg">{lang key="paymentMethodsManage.cvcNumberNotValid"}</span>
    </div>
</div>
{include file="$template/payment/billing-address.tpl"}
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
