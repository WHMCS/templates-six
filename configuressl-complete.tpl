{if $errormessage}

    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage textcenter=true}

{else}

    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.sslconfigcomplete textcenter=true}

    <p>{$LANG.sslconfigcompletedetails}</p>

    <form method="post" action="clientarea.php?action=productdetails">
        <input type="hidden" name="id" value="{$serviceid}" />
        <p><input type="submit" value="{$LANG.invoicesbacktoclientarea}" class="btn btn-default"/></p>
    </form>
{/if}
