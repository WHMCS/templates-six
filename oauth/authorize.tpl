<div class="content-container">

    {if $appLogo}
        <div class="app-logo">
            <img src="{$appLogo}" />
        </div>
    {/if}

    <h2 class="text-center">{lang key='oauth.authoriseAppToAccess' appName=$appName}</h2>

    <div class="content-padded">
        <div class="permission-grants">
            <p>{lang key='oauth.willBeAbleTo'}:</p>
            <ul>
                {foreach $requestedPermissions as $permission}
                    <li>{$permission}</li>
                {/foreach}
            </ul>
        </div>
    </div>

    <form method="post" action="#" role="form">
        {foreach $requestedAuthorizations as $auth}
            <input type="hidden" name="authz[]" value="{$auth}" />
        {/foreach}
        <div class="action-buttons">
            <button name="userAuthorization" id="userAuthorizationAccepted" value="yes" type="submit" class="btn btn-primary">
                {lang key='oauth.authorise'}
            </button>
            <button name="userAuthorization" id="userAuthorizationDeclined" value="no" type="submit" class="btn btn-default">
                {lang key='cancel'}
            </button>
        </div>
    </form>

</div>
