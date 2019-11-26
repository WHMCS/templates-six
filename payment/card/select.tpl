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
                        {if $cardOnFile && !$payMethodExpired && $payMethodId eq $cardInfo.paymethodid}
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
        <input id="newCCInfo" type="radio" class="icheck-button" name="ccinfo" value="new" {if $payMethodId eq "new" || !$cardOnFile} checked{/if} /> {$LANG.creditcardenternewcard}
    </label>
</div>
