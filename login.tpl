<div class="logincontainer">

    {include file="$template/includes/pageheader.tpl" title=$LANG.login desc="{$LANG.restrictedpage}"}

    {if $incorrect}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.loginincorrect textcenter=true}
    {elseif $verificationId && empty($transientDataName)}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.verificationKeyExpired textcenter=true}
    {elseif $ssoredirect}
        {include file="$template/includes/alert.tpl" type="info" msg=$LANG.sso.redirectafterlogin textcenter=true}
    {/if}

    <form method="post" action="{$systemurl}dologin.php" role="form">
        <div class="form-group">
            <label for="inputEmail">{$LANG.clientareaemail}</label>
            <input type="email" name="username" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
        </div>

        <div class="form-group">
            <label for="inputPassword">{$LANG.clientareapassword}</label>
            <input type="password" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="off" >
        </div>

        <div class="checkbox">
            <label>
                <input type="checkbox" name="rememberme" /> {$LANG.loginrememberme}
            </label>
        </div>

        <div align="center">
            <input id="login" type="submit" class="btn btn-primary" value="{$LANG.loginbutton}" /> <a href="pwreset.php" class="btn btn-default">{$LANG.forgotpw}</a>
        </div>
    </form>

</div>
