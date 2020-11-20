<form method="post" action="clientarea.php?action=masspay" class="form-horizontal">
    <input type="hidden" name="geninvoice" value="true" />

    <table class="table">
        <thead>
            <tr>
                <th>{$LANG.invoicesdescription}</th>
                <th>{$LANG.invoicesamount}</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$invoiceitems key=invid item=invoiceitem}
                <tr>
                    <td colspan="2" class="bg-info">
                        <strong>{$LANG.invoicenumber} {if $invoiceitem.0.invoicenum}{$invoiceitem.0.invoicenum}{else}{$invid}{/if}</strong>
                        <input type="hidden" name="invoiceids[]" value="{$invid}" />
                    </td>
                </tr>
                {foreach from=$invoiceitem item=item}
                    <tr class="masspay-invoice-detail">
                        <td>{$item.description}</td>
                        <td>{$item.amount}</td>
                    </tr>
                {/foreach}
            {foreachelse}
                <tr>
                    <td colspan="6" align="center">{$LANG.norecordsfound}</td>
                </tr>
            {/foreach}
            <tr class="masspay-total">
                <td class="text-right">{$LANG.invoicessubtotal}:</td>
                <td>{$subtotal}</td>
            </tr>
            {if $tax}
                <tr class="masspay-total">
                    <td class="text-right">{$taxrate1}% {$taxname1}:</td>
                    <td>{$tax}</td>
                </tr>
            {/if}
            {if $tax2}
                <tr class="masspay-total">
                    <td class="text-right">{$taxrate2}% {$taxname2}:</td>
                    <td>{$tax2}</td>
                </tr>
            {/if}
            {if $credit}
                <tr class="masspay-total">
                    <td class="text-right">{$LANG.invoicescredit}:</td>
                    <td>{$credit}</td>
                </tr>
            {/if}
            {if $partialpayments}
                <tr class="masspay-total">
                    <td class="text-right">{$LANG.invoicespartialpayments}:</td>
                    <td>{$partialpayments}</td>
                </tr>
            {/if}
            <tr class="masspay-total">
                <td class="text-right">{$LANG.invoicestotaldue}:</td>
                <td>{$total}</td>
            </tr>
        </tbody>
    </table>

    <div class="row">
        <div class="col-sm-6 col-sm-offset-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.masspaymentselectgateway}</h3>
                </div>
                <div class="panel-body">
                    <fieldset>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="paymentmethod" class="control-label">{$LANG.orderpaymentmethod}:</label><br/>
                                <select name="paymentmethod" id="paymentmethod" class="form-control">
                                    {foreach from=$gateways item=gateway}
                                        <option value="{$gateway.sysname}">{$gateway.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="submit" value="{$LANG.masspaymakepayment}" class="btn btn-primary btn-block" id="btnMassPayMakePayment" />
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>

</form>
