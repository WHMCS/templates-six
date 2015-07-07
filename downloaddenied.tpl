{if $reason eq "supportandupdates"}

    {include file="$template/includes/alert.tpl" type="error" msg="{$LANG.supportAndUpdatesExpiredLicense}{if $licensekey}: {$licensekey}{else}.{/if}" textcenter=true}

{/if}

{if $reason eq "supportandupdates"}

    <p>{$LANG.supportAndUpdatesRenewalRequired}</p>

    <form action="{$systemsslurl}cart.php?a=add" method="post">
        <input type="hidden" name="productid" value="{$serviceid}" />
        <input type="hidden" name="aid" value="{$addonid}" />
        <p align="center"><input type="submit" value="{$LANG.supportAndUpdatesClickHereToRenew} &raquo;" class="btn" /></p>
    </form>

{else}

    <p>{$LANG.downloadproductrequired}</p>

    {if $prodname}
        {include file="$template/includes/alert.tpl" type="info" msg=$prodname textcenter=true}
    {else}
        {include file="$template/includes/alert.tpl" type="info" msg=$addonname textcenter=true}
    {/if}

    {if $pid || $aid}
        <form action="{$systemsslurl}cart.php" method="post">
            {if $pid}
                <input type="hidden" name="a" value="add" />
                <input type="hidden" name="pid" value="{$pid}" />
            {elseif $aid}
                <input type="hidden" name="gid" value="addons" />
            {/if}
            <p align="center"><input type="submit" value="{$LANG.ordernowbutton} &raquo;" class="btn" /></p>
        </form>
    {/if}

{/if}
