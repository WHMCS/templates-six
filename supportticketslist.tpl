{include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}

<div class="table-container clearfix">
    <table id="tableTicketsList" class="table table-list">
        <thead>
            <tr>
                <th>{$LANG.supportticketsdepartment}</th>
                <th>{$LANG.supportticketssubject}</th>
                <th>{$LANG.supportticketsstatus}</th>
                <th>{$LANG.supportticketsticketlastupdated}</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$tickets item=ticket}
                <tr onclick="window.location='viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}'">
                    <td class="text-center">{$ticket.department}</td>
                    <td><a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{if $ticket.unread}<strong>{/if}#{$ticket.tid} - {$ticket.subject}{if $ticket.unread}</strong>{/if}</a></td>
                    <td><span class="label status {if is_null($ticket.statusColor)}status-{$ticket.statusClass}"{else}status-custom" style="border-color: {$ticket.statusColor}; color: {$ticket.statusColor}"{/if}>{$ticket.status|strip_tags}</span></td>
                    <td class="text-center"><span class="hidden">{$ticket.normalisedLastReply}</span>{$ticket.lastreply}</td>
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>
