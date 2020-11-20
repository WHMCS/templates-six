<div class="logincontainer">

    {include file="$template/includes/pageheader.tpl" title=$LANG.twofactorauth}

    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset textcenter=true}

    <h2 class="text-center">{$LANG.twofanewbackupcodeis}</h2>

    {include file="$template/includes/alert.tpl" type="warning" msg=$newBackupCode textcenter=true}

    <p class="text-center">{$LANG.twofabackupcodeexpl}</p>

    <p class="text-center">
        <a href="{routePath('clientarea-home')}" class="btn btn-default">
            {$LANG.continue} &raquo;
        </a>
    </p>

</div>
