<div class="content-container">

    {if $appLogo}
        <div class="app-logo">
            <img src="{$appLogo}" />
        </div>
    {/if}

    <h2 class="text-center">Authorize {$appName}<br />to access your account?</h2>

    <div class="content-padded">
        <div class="permission-grants">
            <p>This application will be able to:</p>
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
                Authorize
            </button>
            <button name="userAuthorization" id="userAuthorizationDeclined" value="no" type="submit" class="btn btn-default">
                Cancel
            </button>
        </div>
    </form>

</div>
