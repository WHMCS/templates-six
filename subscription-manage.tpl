<div class="row">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

        {if $errorMessage}

            {include file="$template/includes/alert.tpl" type="danger" msg=$errorMessage textcenter=true}

        {elseif $infoMessage}

            {include file="$template/includes/alert.tpl" type="info" msg=$infoMessage textcenter=true}

        {elseif $action == 'optin'}

            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.thankYou textcenter=true}
            <p class="text-center">{$LANG.newslettersubscribed}</p>

        {elseif $action == 'optout'}

            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.thankYou textcenter=true}
            <p>{$LANG.newsletterremoved}</p>
            <p>{$LANG.newsletterresubscribe|sprintf2:'<a href="clientarea.php?action=details">':'</a>'}</p>

        {/if}

        <br>

        <p class="text-center">
            <a href="{$WEB_ROOT}/index.php" class="btn btn-default">
                <i class="fas fa-home"></i>
                {$LANG.returnhome}
            </a>
        </p>

    </div>
</div>

<br /><br />
