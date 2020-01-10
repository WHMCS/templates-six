{if count($existingAccounts) > 0}
    <div class="two-column-grid">
        {foreach $existingAccounts as $bankAccount}
            {assign "payMethod" $bankAccount.payMethod nocache}
            <div class="paymethod-info" data-paymethod-id="{$bankAccount.paymethodid}">
                <input
                        id="existingAccount{$bankAccount.paymethodid}"
                        type="radio"
                        name="paymethod"
                        class="existing-account icheck-button"
                        data-billing-contact-id="{$bankAccount.billingcontactid}"
                        {if $existingAccount && $payMethodId eq $bankAccount.paymethodid}
                            {assign "preselectedBillingContactId" {$bankAccount.billingcontactid}}
                            checked="checked"
                            data-loaded-paymethod="true"
                        {elseif !$existingAccount}
                            disabled="disabled"
                        {/if}
                        {if !$hasRemoteInput}onclick="hideNewAccountInputFields();"{/if}
                        value="{$bankAccount.paymethodid}"
                >
            </div>
            <div class="paymethod-info" data-paymethod-id="{$bankAccount.paymethodid}">
                <label for="existingAccount{$bankAccount.paymethodid}">
                    <i class="{$payMethod->getFontAwesomeIcon()}"></i>
                </label>
            </div>
            <div class="paymethod-info" data-paymethod-id="{$bankAccount.paymethodid}">
                <label for="existingAccount{$bankAccount.paymethodid}">
                    {$payMethod->payment->getDisplayName()}
                </label>
            </div>
            <div class="paymethod-info" data-paymethod-id="{$bankAccount.paymethodid}">
                <label for="existingAccount{$bankAccount.paymethodid}">
                    {$payMethod->getDescription()}
                </label>
            </div>
        {/foreach}
    </div>
{/if}
<div class="paymethod-info">
    <label>
        <input id="newAccountInfo"
               type="radio"
               class="icheck-button"
               name="paymethod"
               value="new"
               {if $payMethodId eq "new" || !$existingAccount} checked="checked"{/if}
        >
        {lang key='paymentMethods.addNewBank'}
    </label>
</div>
