{include file="$template/includes/tablelist.tpl" tableName="QuotesList"  noSortColumns="5" filterColumn="4"}
<script type="text/javascript">
    jQuery(document).ready( function ()
    {
        var table = jQuery('#tableQuotesList').removeClass('hidden').DataTable();
        {if $orderby == 'id'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'validuntil'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'stage'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').addClass('hidden');
    });
</script>
<div class="table-container clearfix">
    <table id="tableQuotesList" class="table table-list hidden">
        <thead>
            <tr>
                <th>{$LANG.quotenumber}</th>
                <th>{$LANG.quotesubject}</th>
                <th>{$LANG.quotedatecreated}</th>
                <th>{$LANG.quotevaliduntil}</th>
                <th>{$LANG.quotestage}</th>
                <th>&nbsp;</th>
                <th class="responsive-edit-button" style="display: none;"></th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$quotes item=quote}
                <tr onclick="clickableSafeRedirect(event, 'viewquote.php?id={$quote.id}', true)">
                    <td>{$quote.id}</td>
                    <td>{$quote.subject}</td>
                    <td><span class="hidden">{$quote.normalisedDateCreated}</span>{$quote.datecreated}</td>
                    <td><span class="hidden">{$quote.normalisedValidUntil}</span>{$quote.validuntil}</td>
                    <td><span class="label status status-{$quote.stageClass}">{$quote.stage}</span></td>
                    <td class="text-center">
                        <form method="submit" action="dl.php">
                            <input type="hidden" name="type" value="q" />
                            <input type="hidden" name="id" value="{$quote.id}" />
                            <button type="submit" class="btn btn-default btn-sm"><i class="fa fa-download"></i> {$LANG.quotedownload}</button>
                        </form>
                    </td>
                    <td class="responsive-edit-button" style="display: none;">
                        <a href="viewquote.php?id={$quote.id}" class="btn btn-block btn-info">
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
