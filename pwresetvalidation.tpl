<div class="logincontainer">

    {include file="$template/includes/pageheader.tpl" title=$LANG.pwreset}

    {if $invalidlink}

        {include file="$template/includes/alert.tpl" type="danger" msg=$invalidlink textcenter=true}

    {elseif $success}

        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.pwresetvalidationsuccess textcenter=true}

        <p class="text-center">
            {$LANG.pwresetsuccessdesc|sprintf2:'<a href="clientarea.php">':'</a>'}
        </p>

    {else}

        {if $errormessage}
            {include file="$template/includes/alert.tpl" type="danger" msg=$errormessage textcenter=true}
        {/if}

        <p>{$LANG.pwresetenternewpw}</p>

        <form class="using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=pwreset">
            <input type="hidden" name="key" id="key" value="{$key}" />

            <div id="newPassword1" class="form-group has-feedback">
                <label class="control-label" for="inputNewPassword1">{$LANG.newpassword}</label>
                <input type="password" name="newpw" id="inputNewPassword1" class="form-control" autocomplete="off" />
                <span class="form-control-feedback glyphicon glyphicon-password"></span>
            </div>

            <div id="newPassword2" class="form-group has-feedback">
                <label class="control-label" for="inputNewPassword2">{$LANG.confirmnewpassword}</label>
                <input type="password" name="confirmpw" id="inputNewPassword2" class="form-control" autocomplete="off" />
                <span class="form-control-feedback glyphicon glyphicon-password"></span>
                <div id="inputNewPassword2Msg"></div>
            </div>

            <div class="form-group">
                <label class="control-label">{$LANG.pwstrength}</label>
                {include file="$template/includes/pwstrength.tpl"}
            </div>

            <div class="form-group">
                <div class="text-center">
                    <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
                    <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
                </div>
            </div>

        </form>

    {/if}

</div>
