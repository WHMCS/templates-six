{if ($linkableProviders || $hasLinkedProvidersEnabled) && $linkContext == 'linktable'}
    <table id="tableLinkedAccounts" class="table display data-driven"
           data-ajax-url="{$linkedAccountsUrl}"
           data-on-draw-rebind-confirmation="true"
           data-lang-empty-table="{lang key='remoteAuthn.noLinkedAccounts'}"
    >
        <thead>
        <tr class="text-center">
            <th>{lang key='remoteAuthn.provider'}</th>
            <th>{lang key='remoteAuthn.name'}</th>
            <th>{lang key='remoteAuthn.emailAddress'}</th>
            <th>{lang key='remoteAuthn.actions'}</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="4" class="text-center">{lang key='remoteAuthn.noLinkedAccounts'}</td>
        </tr>
        </tbody>
    </table>
{elseif $linkableProviders}

    <div id="providerLinkingMessages" class="hidden">
        <p class="providerLinkingMsg-preLink-init_failed">
            <span class="provider-name"></span> {lang key='remoteAuthn.unavailable'}
        </p>
        <p class="providerLinkingMsg-preLink-connect_error">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
        <p class="providerLinkingMsg-preLink-complete_sign_in">
            {lang key='remoteAuthn.completeSignIn'}
        </p>
        <p class="providerLinkingMsg-preLink-2fa_needed">
            {lang key='remoteAuthn.redirecting'}
        </p>
        <p class="providerLinkingMsg-preLink-linking_complete">
            <strong>{lang key='remoteAuthn.success'}</strong> {lang key='remoteAuthn.accountNowLinked'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-signin-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.oneTimeAuthRequired'}
        </p>
        <p class="providerLinkingMsg-preLink-login_to_link-registration-required">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeRegistrationForm'}
        </p>
        <p class="providerLinkingMsg-preLink-checkout-new">
            <strong>{lang key='remoteAuthn.linkInitiated'}</strong> {lang key='remoteAuthn.completeNewAccountForm'}
        </p>
        <p class="providerLinkingMsg-preLink-other_user_exists">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.linkedToAnotherClient'}
        </p>
        <p class="providerLinkingMsg-preLink-already_linked">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.alreadyLinkedToYou'}
        </p>
        <p class="providerLinkingMsg-preLink-default">
            <strong>{lang key='remoteAuthn.error'}</strong> {lang key='remoteAuthn.connectError'}
        </p>
    </div>

    {if $linkContext == 'registration'}
        <div class="sub-heading">
            <span>{lang key='remoteAuthn.titleSignUpVerb'}</span>
        </div>
    {elseif $linkContext == 'checkout-existing'}
        <div class="sub-heading-borderless">
            <span>{lang key='remoteAuthn.titleOr'}</span>
        </div>
        <p class="small text-center text-muted">{lang key='remoteAuthn.saveTimeByLinking'}</p>
    {elseif $linkContext == 'checkout-new'}
        <div class="sub-heading">
            <span>{lang key='remoteAuthn.titleSignUpVerb'}</span>
        </div>
        <p class="small text-center text-muted">{lang key='remoteAuthn.saveTimeByLinking'}</p>
    {elseif $linkContext == 'clientsecurity'}
        <p>{lang key='remoteAuthn.mayHaveMultipleLinks'}</p>
    {/if}

    <div class="providerPreLinking" data-link-context="{$linkContext}"
         data-hide-on-prelink={if in_array($linkContext, ['clientsecurity','login'])}0{else}1{/if}
         data-disable-on-prelink=0>
        <div class="social-signin-btns">
            {foreach $linkableProviders as $provider }
                {if in_array($linkContext, ['checkout-existing'])}
                    {$provider.login_button}
                {else}
                    {$provider.code}
                {/if}
            {/foreach}
        </div>
    </div>

    {if !isset($customFeedback) || !$customFeedback}
        <div class="providerLinkingFeedback"></div>
    {/if}

{/if}
