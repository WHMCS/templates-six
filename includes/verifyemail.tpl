{if $emailVerificationIdValid}
    <div class="email-verification alert-success">
        <div class="container">
            <i class="fa fa-check"></i>
            {$LANG.emailAddressVerified}
        </div>
    </div>
{elseif $emailVerificationIdValid === false}
    <div class="email-verification alert-danger">
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
    <div class="email-verification alert-warning">
        <div class="container">
            <i class="fa fa-warning"></i>
            {$LANG.verifyEmailAddress}
            <div class="pull-right">
                <button id="btnResendVerificationEmail" class="btn btn-default btn-sm">
                    {$LANG.resendEmail}
                </button>
            </div>
        </div>
    </div>
{/if}
