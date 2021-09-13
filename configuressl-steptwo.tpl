{if empty($approvalMethods)}
    {assign var="approvalMethods" value=[]}
{/if}
{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

<form class="form-horizontal" method="post" action="{$smarty.server.PHP_SELF}?cert={$cert}&step=3">

    {include file="$template/includes/subheader.tpl" title={lang key='ssl.selectValidation'}}
    <div class="margin-top margin-bottom">
        {if empty($approvalMethods) || (!empty($approvalMethods) && in_array('email', $approvalMethods))}
            <label class="form-check form-check-inline">
                <input type="radio" class="icheck-button" name="approval_method" value="email" checked>
                <strong class="name">{lang key='ssl.emailMethod'}</strong>
            </label>
        {/if}
        {if in_array('dns-txt-token', $approvalMethods)}
            <label class="form-check form-check-inline">
                <input type="radio" class="icheck-button" name="approval_method" value="dns-txt-token">
                <strong class="name">{lang key='ssl.dnsMethod'}</strong>
            </label>
        {/if}
        {if in_array('file', $approvalMethods)}
            <label class="form-check form-check-inline">
                <input type="radio" class="icheck-button" name="approval_method" value="file">
                <strong class="name">{lang key='ssl.fileMethod'}</strong>
            </label>
        {/if}
    </div>

    <div class="tab-content">
        <div id="containerApprovalMethodEmail">
            <div class="well">{lang key='ssl.emailMethodDescription'}</div>
            <p>{lang key='ssl.selectEmail'}</p>
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
        </div>
        <div id="containerApprovalMethodDns" style="display: none;">
            <div class="well">{lang key='ssl.dnsMethodDescription'}</div>
        </div>
        <div id="containerApprovalMethodFile" style="display: none;">
            <div class="well">{lang key='ssl.fileMethodDescription'}</div>
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
