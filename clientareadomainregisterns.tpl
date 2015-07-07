<h3>{$LANG.domainregisterns}</h3>

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.domainregisternsexplanation}

{if $result}
    {include file="$template/includes/alert.tpl" type="warning" msg=$result textcenter=true}
{/if}

<form class="form-horizontal" role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
    <input type="hidden" name="sub" value="register" />
    <input type="hidden" name="domainid" value="{$domainid}" />

    <h4>{$LANG.domainregisternsreg}</h4>

    <div class="form-group">
        <label for="inputNs1" class="col-xs-4 control-label">{$LANG.domainregisternsns}</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" id="inputNs1" name="ns" />
        </div>
        <div class="col-xs-5">
            . {$domain}
        </div>
    </div>
    <div class="form-group">
        <label for="inputIp1" class="col-xs-4 control-label">{$LANG.domainregisternsip}</label>
        <div class="col-xs-6 col-sm-5">
            <input type="text" class="form-control" id="inputIp1" name="ipaddress" />
        </div>
    </div>

    <p class="text-center">
        <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
    </p>

</form>

<form class="form-horizontal" role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
    <input type="hidden" name="sub" value="modify" />
    <input type="hidden" name="domainid" value="{$domainid}" />

    <h4>{$LANG.domainregisternsmod}</h4>

    <div class="form-group">
        <label for="inputNs2" class="col-xs-4 control-label">{$LANG.domainregisternsns}</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" id="inputNs2" name="ns" />
        </div>
        <div class="col-xs-5">
            . {$domain}
        </div>
    </div>
    <div class="form-group">
        <label for="inputIp2" class="col-xs-4 control-label">{$LANG.domainregisternscurrentip}</label>
        <div class="col-xs-6 col-sm-5">
            <input type="text" class="form-control" id="inputIp2" name="currentipaddress" />
        </div>
    </div>
    <div class="form-group">
        <label for="inputIp3" class="col-xs-4 control-label">{$LANG.domainregisternsnewip}</label>
        <div class="col-xs-6 col-sm-5">
            <input type="text" class="form-control" id="inputIp3" name="newipaddress" />
        </div>
    </div>

    <p class="text-center">
        <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
    </p>

</form>

<form class="form-horizontal" role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domainregisterns">
    <input type="hidden" name="sub" value="delete" />
    <input type="hidden" name="domainid" value="{$domainid}" />

    <h4>{$LANG.domainregisternsdel}</h4>

    <div class="form-group">
        <label for="inputNs3" class="col-xs-4 control-label">{$LANG.domainregisternsns}</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" id="inputNs3" name="ns" />
        </div>
        <div class="col-xs-5">
            . {$domain}
        </div>
    </div>

    <p class="text-center">
        <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
    </p>

</form>
