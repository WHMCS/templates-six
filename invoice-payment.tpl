{if $showRemoteInput}
    <div id="frmRemoteCardProcess" class="text-center" align="center">
        {$remoteInput}
        <iframe name="ccframe" class="auth3d-area" width="90%" height="600" scrolling="auto" src="about:blank"></iframe>
    </div>

    <script language="javascript">
        jQuery("#frmRemoteCardProcess").find("form:first").attr('target', 'ccframe');
        setTimeout("autoSubmitFormByContainer('frmRemoteCardProcess')", 1000);
    </script>
{else}
    {include file="$template/payment/$cardOrBank/validate.tpl"}
    <form id="frmPayment" method="post" action="{$submitLocation}" class="form-horizontal" role="form">
        <input type="hidden" name="invoiceid" value="{$invoiceid}" />

        <div class="row">
            <div class="col-md-7">

                {if $errormessage}
                    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
                {/if}

                <div class="alert alert-danger text-center gateway-errors w-hidden"></div>

                <div class="form-group">
                    <label class="col-sm-4 control-label">
                        {lang key='paymentmethod'}
                    </label>
                    <div class="col-sm-8">
                        {include file="$template/payment/$cardOrBank/select.tpl"}
                    </div>
                </div>

                {if !$hasRemoteInput}
                    {include file="$template/payment/$cardOrBank/inputs.tpl"}
                {/if}
                <div id="btnSubmitContainer" class="form-group submit-container">
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary btn-lg margin-top-5" id="btnSubmit" value="{lang key='submitpayment'}">
                            <span class="pay-text">{lang key='submitpayment'}</span>
                            <span class="click-text w-hidden">{lang key='pleasewait'}</span>
                        </button>
                    </div>
                </div>

            </div>
            <div class="col-md-5">
                {include file="$template/payment/invoice-summary.tpl"}
            </div>
        </div>

        {if $servedOverSsl}
            <div class="alert alert-warning" role="alert">
                <i class="fas fa-lock"></i> &nbsp; {lang key='creditcardsecuritynotice'}
            </div>
        {/if}

    </form>

    <script>
    jQuery(document).ready(function() {
        jQuery('#inputCardCvv, #inputCardNumber').filter(':visible').first().focus();
    });
    </script>
{/if}
