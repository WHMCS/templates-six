{if $emailVerificationIdValid}
    <div class="email-verification success">
        <div class="container">
            <i class="fa fa-check"></i>
            <span class="text">{$LANG.emailAddressVerified}</span>
        </div>
    </div>
{elseif $emailVerificationIdValid === false}
    <div class="email-verification failed">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 col-xs-push-10 col-sm-1 col-sm-push-11">
                    <button type="button" class="btn close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="col-xs-10 col-xs-pull-2 col-sm-7 col-sm-pull-1 col-md-8">
                    <i class="fa fa-times-circle"></i>
                    <span class="text">{$LANG.emailKeyExpired}</span>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3 col-sm-pull-1">
                    <button id="btnResendVerificationEmail" class="btn btn-default btn-sm btn-block">
                    {$LANG.resendEmail}
                </button>
                </div>
            </div>
        </div>
    </div>
{elseif $emailVerificationPending && !$showingLoginPage}
    <div class="email-verification">
        <div class="container">
            <div class="row">
                <div class="col-xs-2 col-xs-push-10 col-sm-1 col-sm-push-11">
                    <button type="button" class="btn close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="col-xs-10 col-xs-pull-2 col-sm-7 col-sm-pull-1 col-md-8">
                    <i class="fa fa-warning"></i>
                    <span class="text">{$LANG.verifyEmailAddress}</span>
                </div>
                <div class="col-xs-12 col-sm-4 col-md-3 col-sm-pull-1">
                    <button id="btnResendVerificationEmail" class="btn btn-default btn-sm btn-block btn-resend-verify-email">
                        {$LANG.resendEmail}
                    </button>
                </div>
            </div>
        </div>
    </div>
{/if}
