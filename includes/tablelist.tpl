<link rel="stylesheet" type="text/css" href="{$BASE_PATH_CSS}/dataTables.bootstrap.css">
<link rel="stylesheet" type="text/css" href="{$BASE_PATH_CSS}/dataTables.responsive.css">
<script type="text/javascript" charset="utf8" src="{$BASE_PATH_JS}/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="{$BASE_PATH_JS}/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" charset="utf8" src="{$BASE_PATH_JS}/dataTables.responsive.min.js"></script>

{if isset($filterColumn) && $filterColumn}
<script type="text/javascript">

if (typeof(buildFilterRegex) !== "function") {
    function buildFilterRegex(filterValue) {

        if (filterValue.indexOf('&') === -1) {
            return '[~>]\\s*' + jQuery.fn.dataTable.util.escapeRegex(filterValue) + '\\s*[<~]';
        } else {
            var tempDiv = document.createElement('div');
            tempDiv.innerHTML = filterValue;

            return '\\s*' + jQuery.fn.dataTable.util.escapeRegex(tempDiv.innerText) + '\\s*';
        }
    }
}

jQuery(".view-filter-btns a").click(function(e) {ldelim}
    var filterValue = jQuery(this).find("span").not('.badge').html().trim();
    var dataTable = jQuery('#table{$tableName}').DataTable();
    var filterValueRegex;
    if (jQuery(this).hasClass('active')) {ldelim}
        {if !isset($dontControlActiveClass) || !$dontControlActiveClass}
            jQuery(this).removeClass('active');
            jQuery(this).find("i.fa.fa-dot-circle-o").removeClass('fa-dot-circle-o').addClass('fa-circle-o');
        {/if}
        dataTable.column({$filterColumn}).search('').draw();
    {rdelim} else {ldelim}
        {if !isset($dontControlActiveClass) || !$dontControlActiveClass}
            jQuery('.view-filter-btns .list-group-item').removeClass('active');
            jQuery('i.fa.fa-dot-circle-o').removeClass('fa-dot-circle-o').addClass('fa-circle-o');
            jQuery(this).addClass('active');
            jQuery(this).find(jQuery("i.fa.fa-circle-o")).removeClass('fa-circle-o').addClass('fa-dot-circle-o');
        {/if}
        filterValueRegex = buildFilterRegex(filterValue);
        dataTable.column({$filterColumn})
            .search(filterValueRegex, true, false, false)
            .draw();
    {rdelim}

    // Prevent jumping to the top of the page
    // when no matching tag is found.
    e.preventDefault();
{rdelim});
</script>
{/if}

<script type="text/javascript">
var alreadyReady = false; // The ready function is being called twice on page load.
jQuery(document).ready( function () {ldelim}
    var table = jQuery("#table{$tableName}").DataTable({ldelim}
        "dom": '<"listtable"fit>pl',{if isset($noPagination) && $noPagination}
        "paging": false,{/if}{if isset($noInfo) && $noInfo}
        "info": false,{/if}{if isset($noSearch) && $noSearch}
        "filter": false,{/if}
        "responsive": true,
        "oLanguage": {ldelim}
            "sEmptyTable":     "{$LANG.norecordsfound}",
            "sInfo":           "{$LANG.tableshowing}",
            "sInfoEmpty":      "{$LANG.tableempty}",
            "sInfoFiltered":   "{$LANG.tablefiltered}",
            "sInfoPostFix":    "",
            "sInfoThousands":  ",",
            "sLengthMenu":     "{$LANG.tablelength}",
            "sLoadingRecords": "{$LANG.tableloading}",
            "sProcessing":     "{$LANG.tableprocessing}",
            "sSearch":         "",
            "sZeroRecords":    "{$LANG.norecordsfound}",
            "oPaginate": {ldelim}
                "sFirst":    "{$LANG.tablepagesfirst}",
                "sLast":     "{$LANG.tablepageslast}",
                "sNext":     "{$LANG.tablepagesnext}",
                "sPrevious": "{$LANG.tablepagesprevious}"
            {rdelim}
        {rdelim},
        "pageLength": 10,
        "order": [
            [ {if isset($startOrderCol) && $startOrderCol}{$startOrderCol}{else}0{/if}, "asc" ]
        ],
        "lengthMenu": [
            [10, 25, 50, -1],
            [10, 25, 50, "{$LANG.tableviewall}"]
        ],
        "aoColumnDefs": [
            {ldelim}
                "bSortable": false,
                "aTargets": [ {if isset($noSortColumns) && $noSortColumns !== ''}{$noSortColumns}{/if} ]
            {rdelim},
            {ldelim}
                "sType": "string",
                "aTargets": [ {if isset($filterColumn) && $filterColumn}{$filterColumn}{/if} ]
            {rdelim}
        ],
        "stateSave": true
    {rdelim});

    {if isset($filterColumn) && $filterColumn}
    // highlight remembered filter on page re-load
    var rememberedFilterTerm = table.state().columns[{$filterColumn}].search.search;
    if (rememberedFilterTerm && !alreadyReady) {
        // This should only run on the first "ready" event.
        jQuery(".view-filter-btns a span").each(function(index) {
            if (buildFilterRegex(jQuery(this).text().trim()) == rememberedFilterTerm) {
                jQuery(this).parent('a').addClass('active');
                jQuery(this).parent('a').find('i').removeClass('fa-circle-o').addClass('fa-dot-circle-o');
            }
        });
    }
    {/if}
alreadyReady = true;
{rdelim} );
</script>
