{include file="$template/includes/tablelist.tpl" tableName="BillingNotesList" filterColumn="4"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableBillingNotesList').removeClass('hidden').DataTable();
        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'dateissued'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'notetype'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<div class="table-container clearfix">
    <table id="tableBillingNotesList" class="table table-list hidden">
        <thead>
            <tr>
                <th>{lang key='billingnotes.col.id'}</th>
                <th>{lang key='amount'}</th>
                <th>{lang key='date'}</th>
                <th>{lang key='status'}</th>
                <th>{lang key='type'}</th>
                <th class="responsive-edit-button" style="display: none;"></th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$billingnotes item=note}
                <tr onclick="clickableSafeRedirect(event, '{$note.viewUrl}', true)">
                    <td><a href="{$note.viewUrl}">{$note.id}</a></td>
                    <td data-order="{$note.normalisedTotal}">{$note.total}</td>
                    <td><span class="hidden">{$note.normalisedDateIssued}</span>{$note.dateIssued}</td>
                    <td><span>{$note.status}</span></td>
                    <td><span>{$note.noteType}</span></td>
                    <td class="responsive-edit-button" style="display: none;">
                        <a href="{$note.viewUrl}" class="btn btn-block btn-info">
                            {$LANG.view}
                        </a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {$LANG.loading}</p>
    </div>
</div>
