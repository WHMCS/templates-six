<div class="logincontainer">

    {include file="$template/includes/pageheader.tpl" title=$LANG.twofactorauth}

    {include file="$template/includes/flashmessage.tpl" align="center"}

    {if $newbackupcode}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset textcenter=true}
    {elseif $incorrect}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.twofa2ndfactorincorrect textcenter=true}
    {elseif $error}
        {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
    {else}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofa2ndfactorreq textcenter=true}
    {/if}

    <form method="post" action="{routePath('login-two-factor-challenge-verify')}" id="frmTwoFactorChallenge"{if $usingBackup} class="hidden"{/if}>
        <div class="margin-bottom">
            {$challenge}
        </div>
        <p class="text-center">
            {$LANG.twofacantaccess2ndfactor}
            <a href="#" id="loginWithBackupCode">
                {$LANG.twofaloginusingbackupcode}
            </a>
        </p>
    </form>

    <form method="post" action="{routePath('login-two-factor-challenge-backup-verify')}" id="frmTwoFactorBackup"{if !$usingBackup} class="hidden"{/if}>
        <div class="margin-bottom">
            <input type="text" name="twofabackupcode" class="form-control input-lg" placeholder="{$LANG.twofabackupcodelogin}">
            <br/>
            <button type="submit" class="btn btn-primary btn-lg btn-block" id="btnLogin">
                {$LANG.loginbutton}
            </button>
        </div>
        <p class="text-center">
            <a href="#" id="backupCodeCancel">
                {lang key='cancel'}
            </a>
        </p>
    </form>

</div>

<script>
    jQuery(document).ready(function() {
        jQuery('#loginWithBackupCode').click(function(e) {
            e.preventDefault();
            jQuery('#frmTwoFactorChallenge').hide();
            jQuery('#frmTwoFactorBackup').removeClass('hidden').show();
        });
        jQuery('#backupCodeCancel').click(function(e) {
            e.preventDefault();
            jQuery('#frmTwoFactorChallenge').removeClass('hidden').show();
            jQuery('#frmTwoFactorBackup').hide();
        });
    });
</script>
