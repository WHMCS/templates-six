{if $captcha->isEnabled() && $captcha->isEnabledForForm($captchaForm)}
    <div class="text-center{if $containerClass}{$containerClass}{else} row{/if}">
        {if $templatefile == 'homepage'}
            <div class="domainchecker-homepage-captcha">
        {/if}

        {if $captcha->recaptcha->isEnabled() && !$captcha->recaptcha->isInvisible()}
            <div id="google-recaptcha-domainchecker" class="form-group recaptcha-container"></div>
        {elseif !$captcha->recaptcha->isEnabled()}
            <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                <div id="default-captcha-domainchecker" class="{if $filename == 'domainchecker'}input-group input-group-box {/if}text-center">
                    <p>{lang key="captchaverify"}</p>

                    <div class="col-xs-6 captchaimage">
                        <img id="inputCaptchaImage" data-src="{$systemurl}includes/verifyimage.php" src="{$systemurl}includes/verifyimage.php" align="middle" />
                    </div>

                    <div class="col-xs-6">
                        <input id="inputCaptcha" type="text" name="code" maxlength="6" class="form-control {if $filename == 'register'}pull-left{/if}"
                               data-toggle="tooltip" data-placement="right" data-trigger="manual" title="{lang key='orderForm.required'}"/>
                    </div>
                </div>
            </div>
        {/if}

        {if $templatefile == 'homepage'}
            </div>
        {/if}
    </div>
{/if}
