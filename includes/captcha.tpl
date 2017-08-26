{if $captcha}
    <div class="row">
        {if $filename == 'index'}
            <div class="domainchecker-homepage-captcha">
        {/if}

        {if $captcha == "recaptcha"}
            <script src="https://www.google.com/recaptcha/api.js" async defer></script>
            <div id="google-recaptcha-domainchecker" class="g-recaptcha center-block" data-sitekey="{$reCaptchaPublicKey}"></div>
        {else}
            <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                <div id="default-captcha-domainchecker" class="{if $filename == 'domainchecker'}input-group input-group-box {/if}text-center">
                    <p>{lang key="captchaverify"}</p>

                    <div class="col-xs-6 captchaimage">
                        <img id="inputCaptchaImage" src="includes/verifyimage.php" align="middle" />
                    </div>

                    <div class="col-xs-6">
                        <input id="inputCaptcha" type="text" name="code" maxlength="5" class="form-control {if $filename == 'register'}pull-left{/if}" />
                    </div>
                </div>
            </div>
        {/if}

        {if $filename == 'index'}
            </div>
        {/if}
    </div>
{/if}
