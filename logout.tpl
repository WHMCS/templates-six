<div class="logincontainer">

    {include file="$template/includes/pageheader.tpl" title=$LANG.logouttitle}

    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.logoutsuccessful textcenter=true}

    <div class="main-content">
        <p class="text-center">
            <a href="index.php" class="btn btn-default">{$LANG.logoutcontinuetext}</a>
        </p>
    </div>
</div>
