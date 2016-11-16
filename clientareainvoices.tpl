{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableInvoicesList').removeClass('hidden').DataTable();
        {if $orderby == 'default'}
            table.order([4, 'desc'], [2, 'asc']);
        {elseif $orderby == 'invoicenum'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'duedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>

<div class="table-container clearfix">
    <table id="tableInvoicesList" class="table table-list hidden">
        <thead>
            <tr>
                <th>{$LANG.invoicestitle}</th>
                <th>{$LANG.invoicesdatecreated}</th>
                <th>{$LANG.invoicesdatedue}</th>
                <th>{$LANG.invoicestotal}</th>
                <th>{$LANG.invoicesstatus}</th>
                <th class="responsive-edit-button" style="display: none;"></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=num item=invoice from=$invoices}
                <tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
                    <td>{$invoice.invoicenum}</td>
                    <td><span class="hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}</td>
                    <td><span class="hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}</td>
                    <td data-order="{$invoice.totalnum}">{$invoice.total}</td>
                    <td><span class="label status status-{$invoice.statusClass}">{$invoice.status}</span></td>
                    <td class="responsive-edit-button" style="display: none;">
                        <a href="viewinvoice.php?id={$invoice.id}" class="btn btn-block btn-info">
                            {$LANG.manageproduct}
                        </a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fa fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
