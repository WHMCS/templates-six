<div class="content-container">

    <br />

    <h2 class="text-center">{$LANG.twofactorauth}</h2>

    <form method="post" action="{routePath('login-two-factor-challenge-verify')}" role="form">

        <div id="loginWithBackupCode"{if !$backupcode} class="hidden"{/if}>
            <div class="content-padded">
                {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofabackupcodelogin textcenter=true}
                <input type="text" name="code" class="form-control">
                <br />
                <button type="submit" name="backupcode" value="1" class="btn btn-primary btn-block" id="btnLogin">
                    {lang key='login'} &raquo;
                </button>
            </div>
            <div class="action-buttons">
                <button type="button" class="btn btn-default" id="btnCancel" onclick="jQuery('#frmCancelLogin').submit()">
                    {lang key='cancel'}
                </button>
            </div>
        </div>

        <div id="loginWithSecondFactor"{if $backupcode} class="hidden"{/if}>
            <div class="content-padded">
                {if $incorrect}
                    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.twofa2ndfactorincorrect textcenter=true}
                {elseif $error}
                    {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
                {else}
                    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofa2ndfactorreq textcenter=true}
                {/if}
                {$challenge}
            </div>
            <div class="action-buttons">
                <div class="pull-left text-left small">
                    {$LANG.twofacantaccess2ndfactor}<br />
                    <a href="#" onclick="jQuery('#loginWithSecondFactor').hide();jQuery('#loginWithBackupCode').removeClass('hidden').show();">{$LANG.twofaloginusingbackupcode}</a>
                </div>
                <button type="button" class="btn btn-default" id="btnCancel" onclick="jQuery('#frmCancelLogin').submit()">
                    {lang key='cancel'}
                </button>
            </div>
        </div>

    </form>

</div>

<form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
    <input type="hidden" name="login_declined" value="yes"/>
    <input type="hidden" name="request_hash" value="{$request_hash}"/>
</form>
