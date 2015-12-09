<div class="content-container">

    {if $appLogo}
        <div class="app-logo">
            <img src="{$appLogo}" />
        </div>
    {/if}

    <h2 class="text-center">Login to grant {$appName}<br />access to your account</h2>

    <form method="post" action="{$issuerurl}dologin.php" role="form">
        <div class="content-padded">

            {if $incorrect}
                {include file="$template/includes/alert.tpl" type="error" msg=$LANG.loginincorrect textcenter=true}
            {/if}

            <div class="form-group">
                <label for="inputEmail">{$LANG.clientareaemail}</label>
                <input type="email" name="username" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
            </div>

            <div class="form-group">
                <label for="inputPassword">{$LANG.clientareapassword}</label>
                <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}">
            </div>

        </div>

        <div class="action-buttons">
            <div class="pull-left">
                <div class="checkbox">
                    <label>
                        <input type="checkbox" name="rememberme" /> {$LANG.loginrememberme}
                    </label>
                    &bull;
                    <a href="#">Forgot password?</a>
                </div>
            </div>
            <button type="submit" class="btn btn-primary" id="btnLogin">
                Login
            </button>
            <button type="button" class="btn btn-default" id="btnCancel" onclick="jQuery('#frmCancelLogin').submit()">
                Cancel
            </button>
        </div>

    </form>

</div>

<form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
    <input type="hidden" name="login_declined" value="yes"/>
    <input type="hidden" name="request_hash" value="{$request_hash}"/>
</form>
