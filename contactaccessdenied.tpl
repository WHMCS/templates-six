<div class="error-container">
    <h1>{$LANG.oops}!</h1>
    <p>{$LANG.subaccountpermissiondenied}</p>
    {if !empty($allowedpermissions)}
        <p>{$LANG.subaccountallowedperms}</p>
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
                <div class="well text-left">
                    <ul>
                        {foreach from=$allowedpermissions item=permission}
                            <li>{$permission}</li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        </div>
    {/if}
    <p>{$LANG.subaccountcontactmaster}</p>
    <div class="buttons">
        <a href="javascript:history.go(-1)" class="btn btn-primary btn-lg">
            <i class="fa fa-arrow-circle-left"></i>
            {$LANG.goback}
        </a>
        <a href="index.php" class="btn btn-default btn-lg">
            <i class="fa fa-home"></i>
            {$LANG.returnhome}
        </a>
    </div>
</div>
