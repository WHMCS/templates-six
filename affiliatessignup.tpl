{if $affiliatesystemenabled}

    {include file="$template/includes/alert.tpl" type="info" title=$LANG.affiliatesignuptitle msg=$LANG.affiliatesignupintro|cat:'<br /><br />' textcenter=true}

    <ul>
        <li>{$LANG.affiliatesignupinfo1}</li>
        <li>{$LANG.affiliatesignupinfo2}</li>
        <li>{$LANG.affiliatesignupinfo3}</li>
    </ul>

    <br />

    <form method="post" action="affiliates.php">
        <input type="hidden" name="activate" value="true" />
        <p align="center"><input type="submit" value="{$LANG.affiliatesactivate}" class="btn btn-success" /></p>
    </form>

{else}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.affiliatesdisabled textcenter=true}
{/if}
