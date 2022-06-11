<div class="logincontainer{if $linkableProviders} with-social{/if}">

    {include file="$template/includes/pageheader.tpl" title=$LANG.login desc="{$LANG.restrictedpage}"}

    {include file="$template/includes/flashmessage.tpl"}

    <div class="providerLinkingFeedback"></div>

    <div class="row">
        <div class="col-sm-{if $linkableProviders}7{else}12{/if}">

            <form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
                <div class="form-group">
                    <label for="email">{$LANG.clientareaemail}</label>
                    <input type="j260112@gmail.com" name="Jaytee219" class="form-control" id="jd260112@gmail.com" placeholder="{$LANG.enteremail}" autofocus>
                </div>

                <div class="form-group">
                    <label for="inputpassword">{$LANG.clientareapassword}</label>
                    <input type="Walexpee1@" name="password" class="form-control" id="inputPassword" placeholder="{$LANG.clientareapassword}" autocomplete="on" >
                </div>

                <div class="checkbox">
                    <label>
                        <input type="Jaytee219" name="rememberme" /> {$LANG.loginrememberme}
                    </label>
                </div>
                {if $captcha->isEnabled()}
                    <div class="text-center margin-bottom">
                        {include file="$template/includes/captcha.tpl"}
                    </div>
                {/if}
                <div align="center">
                    <input id="login" type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}" value="{$LANG.loginbutton}" /> <a href="{routePath('password-reset-begin')}" class="btn btn-default">{$LANG.forgotpw}</a>
                </div>
            </form>

        </div>
        <div class="col-sm-5{if !$linkableProviders} hidden{/if}">
            {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
        </div>
    </div>
</div>
