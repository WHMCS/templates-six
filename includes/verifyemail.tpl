{if $emailVerificationIdValid}
    <div class="email-verification success">
        <div class="container">
            <i class="fa fa-check"></i>
            {$LANG.emailAddressVerified}
        </div>
    </div>
{elseif $emailVerificationIdValid === false}
    <div class="email-verification failed">
        <div class="container">
            <i class="fa fa-times-circle"></i>
            {$LANG.emailKeyExpired}
            <div class="pull-right">
                <button id="btnResendVerificationEmail" class="btn btn-default btn-sm">
                    {$LANG.resendEmail}
                </button>
            </div>
        </div>
    </div>
{elseif $emailVerificationPending && !$showingLoginPage}
    <div class="email-verification">
        <div class="container">
            <button type="button" class="btn close"><span aria-hidden="true">&times;</span></button>
            <button id="btnResendVerificationEmail" class="btn btn-default btn-sm btn-resend-verify-email hidden-xs">
                {$LANG.resendEmail}
            </button>
            <div class="text">
                <i class="fa fa-warning"></i>
                <span>{$LANG.verifyEmailAddress}</span>
            </div>
        </div>
    </div>
{/if}
