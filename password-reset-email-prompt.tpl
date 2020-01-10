<p>{$LANG.pwresetemailneeded}</p>

<form method="post" action="{routePath('password-reset-validate-email')}" role="form">
    <input type="hidden" name="action" value="reset" />

    <div class="form-group">
        <label for="inputEmail">{$LANG.loginemail}</label>
        <input type="email" name="email" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
    </div>

    {if $captcha->isEnabled()}
        <div class="text-center margin-bottom">
            {include file="$template/includes/captcha.tpl"}
        </div>
    {/if}

    <div class="form-group text-center">
        <button type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">
            {$LANG.pwresetsubmit}
        </button>
    </div>

</form>
