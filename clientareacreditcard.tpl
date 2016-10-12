{if $remoteupdatecode}

    <div align="center">
        {$remoteupdatecode}
    </div>

{else}

    <div class="credit-card">
        <div class="card-icon pull-right">
            <b class="fa fa-2x
            {if $cardtype eq "American Express"}
                fa-cc-amex logo-amex
            {elseif $cardtype eq "Visa"}
                fa-cc-visa logo-visa
            {elseif $cardtype eq "MasterCard"}
                fa-cc-mastercard logo-mastercard
            {elseif $cardtype eq "Discover"}
                fa-cc-discover logo-discover
            {else}
                fa-credit-card
            {/if}">&nbsp;</b>
        </div>
        <div class="card-type">
            {if $cardtype neq "American Express" && $cardtype neq "Visa" && $cardtype neq "MasterCard" && $cardtype neq "Discover"}
                {$cardtype}
            {/if}
        </div>
        <div class="card-number">
            {if $cardlastfour}xxxx xxxx xxxx {$cardlastfour}{else}{$LANG.creditcardnonestored}{/if}
        </div>
        <div class="card-start">
            {if $cardstart}Start: {$cardstart}{/if}
        </div>
        <div class="card-expiry">
            {if $cardexp}Expires: {$cardexp}{/if}
        </div>
        <div class="end"></div>
    </div>

    {if $allowcustomerdelete && $cardtype}
        <form method="post" action="clientarea.php?action=creditcard">
            <input type="hidden" name="remove" value="1" />
            <p class="text-center">
                <button type="submit" class="btn btn-danger">
                    {$LANG.creditcarddelete}
                </button>
            </p>
        </form>
    {/if}

    <h3>{$LANG.creditcardenternewcard}</h3>

    {if $successful}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
    
    {if $card_error}
    <div class="alert alert-danger">
     Your card could not be saved, please try again or contact support.
    </div>
    {/if}

    <div class="alert alert-danger payment-errors" style="display:none;"></div>    

    <form class="form-horizontal" role="form" method="post" action="modules/gateways/stripe-php/stripesave.php" id="payment-form">
    <div class="form-group">
            <label for="inputCardNumber" class="col-sm-4 control-label">{$LANG.creditcardcardnumber}</label>
            <div class="col-sm-6">
                <input type="number" class="form-control card-number2" data-stripe="number" id="inputCardNumber"  autocomplete="off" />
            </div>
        </div>
        
        <div class="form-group">
            <label for="inputCardExpiry" class="col-sm-4 control-label">{$LANG.creditcardcardexpires}</label>
            <div class="col-sm-6">
                <select name="ccexpirymonth" id="inputCardExpiry" class="form-control select-inline card-expiry-month">
                    {foreach from=$months item=month}
                    <option{if $ccstartmonth eq $month} selected{/if}>{$month}</option>
                    {/foreach}
                </select>
                <select name="ccexpiryyear" class="form-control select-inline card-expiry-year">
                    {foreach from=$expiryyears item=year}
                    <option{if $ccstartyear eq $year} selected{/if}>{$year}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="inputCardCVV" class="col-sm-4 col-xs-12 control-label">{$LANG.creditcardcvvnumber}</label>
            <div class="col-sm-2 col-xs-4">
                <input type="number" class="form-control card-cvc" id="inputCardCVV" autocomplete="off" />
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <input class="btn btn-primary submit-button" type="submit" id="submit-button" value="{$LANG.clientareasavechanges}" />
                <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
            </div>
        </div>

    </form>

{/if}
