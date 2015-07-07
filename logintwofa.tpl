<div class="logincontainer">

    {include file="$template/includes/pageheader.tpl" title=$LANG.twofactorauth}

    {if $newbackupcode}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.twofabackupcodereset textcenter=true}
    {elseif $incorrect}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.twofa2ndfactorincorrect textcenter=true}
    {elseif $error}
        {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
    {else}
        {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.twofa2ndfactorreq textcenter=true}
    {/if}

    <form method="post" action="{$systemsslurl}dologin.php" id="frmLogin">
        {if $newbackupcode}
            <input type="hidden" name="newbackupcode" value="1" />
            <h2 class="text-center">{$LANG.twofanewbackupcodeis}</h2>
            {include file="$template/includes/alert.tpl" type="warning" msg=$newbackupcode textcenter=true}
            <p class="text-center">{$LANG.twofabackupcodeexpl}</p>
            <p class="text-center"><input type="submit" value="{$LANG.continue} &raquo;" class="btn" /></p>
        {elseif $backupcode}
            <input type="text" name="code" class="form-control" placeholder="{$LANG.twofabackupcodelogin}">
            <br/>
            <input id="login" type="submit" class="btn btn-primary btn-block" value="{$LANG.loginbutton}" />
            <input type="hidden" name="backupcode" value="1" />
        {else}
            <div class="margin-bottom">
                {$challenge}
            </div>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.twofacantaccess2ndfactor}</h3>
                </div>
                <div class="panel-body">
                    <a href="clientarea.php?backupcode=1">{$LANG.twofaloginusingbackupcode}</a>
                </div>
            </div>
        {/if}
    </form>
</div>
