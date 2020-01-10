<div class="logincontainer">
    {include file="$template/includes/pageheader.tpl" title=$LANG.pwreset}

    {if $loggedin && $innerTemplate}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
    {else}
        {if $successMessage}
            {include file="$template/includes/alert.tpl" type="success" msg=$successTitle textcenter=true}
            <p>{$successMessage}</p>
        {else}
            {if $errorMessage}
                {include file="$template/includes/alert.tpl" type="error" msg=$errorMessage textcenter=true}
            {/if}

            {if $innerTemplate}
                {include file="$template/password-reset-$innerTemplate.tpl"}
            {/if}
        {/if}
    {/if}
</div>
