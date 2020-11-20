{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">

    {include file="$template/includes/subheader.tpl" title=$LANG.sslcertapproveremail}

    <p>{$LANG.sslcertapproveremaildetails}</p>

    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="form-group">
                {foreach from=$approveremails item=approveremail key=num}
                    <div class="radio">
                        <label>
                            <input type="radio" name="approveremail" value="{$approveremail}"{if $num eq 0} checked{/if}>
                            {$approveremail}
                        </label>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>

    <p class="text-center">
        <input type="submit"
               value="{$LANG.ordercontinuebutton}"
               class="btn btn-primary"
               id="btnOrderContinue"
        />
    </p>

</form>
