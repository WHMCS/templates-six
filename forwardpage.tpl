<br />

{include file="$template/includes/alert.tpl" type="info" msg=$message textcenter=true}

<br />

<div class="text-center">

    <img src="{$BASE_PATH_IMG}/loading.gif" alt="Loading" border="0" />

    <br /><br /><br />

    <div id="frmPayment" align="center">

        {$code}

        <form method="post" action="{if $invoiceid}viewinvoice.php?id={$invoiceid}{else}clientarea.php{/if}">
        </form>

    </div>

</div>

<br /><br /><br />

<script language="javascript">
    setTimeout("autoSubmitFormByContainer('frmPayment')", 5000);
</script>
