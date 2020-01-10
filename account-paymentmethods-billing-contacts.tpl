<div id="innerBillingContactsContainer">
<label class="radio-inline icheck-label billing-contact-0">
    <input type="radio" class="icheck-button" name="billingcontact" value="0"{if $payMethod->getContactId() == $client->billingContactId || $payMethod->getContactId() == 0} checked{/if}>
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
        <input type="radio" class="icheck-button" name="billingcontact" value="{$contact->id}"{if $contact->id == $client->billingContactId || $contact->id == $selectedContactId} checked{/if}>
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
</div>

<script>
jQuery(document).ready(function() {
    jQuery('#innerBillingContactsContainer').find('.icheck-button').iCheck({
        inheritID: true,
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%'
    });
});
</script>
