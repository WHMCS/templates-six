{foreach from=$issues item=issue}

    <div class="panel {if $issue.clientaffected}panel-warning{else}panel-info{/if}">
        <div class="panel-heading">
            {$issue.title} ({$issue.status})
        </div>
        <ul class="list-group">
            <li class="list-group-item {if $issue.rawPriority == 'Critical'}list-group-item-danger{elseif $issue.rawPriority == 'High'}list-group-item-warning{elseif $issue.rawPriority == 'Low'}list-group-item-success{else}list-group-item-info{/if}"><strong>{$LANG.networkissuespriority}</strong> - {$issue.priority}</li>
            {if $issue.server or $issue.affecting}<li class="list-group-item"><strong>{$LANG.networkissuesaffecting} {$issue.type}</strong> - {if $issue.type eq $LANG.networkissuestypeserver}{$issue.server}{else}{$issue.affecting}{/if}</li>{/if}
            <li class="list-group-item">
                <p>
                    {$issue.description}
                </p>
            </li>
            <li class="list-group-item"><strong>{$LANG.networkissuesdate}</strong> - {$issue.startdate}{if $issue.enddate} - {$issue.enddate}{/if}</li>
            <li class="list-group-item"><strong>{$LANG.networkissueslastupdated}</strong> - {$issue.lastupdate}</li>
        </ul>
    </div>

{foreachelse}
    {include file="$template/includes/alert.tpl" type="success" msg=$noissuesmsg textcenter=true}
{/foreach}

<div class="btn-group">
    <a href="{if $prevpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$prevpage}{else}#{/if}" class="btn btn-default {if !$prevpage}disabled{/if}">&lt; {$LANG.previouspage}</a>
    <a href="{if $nextpage}{$smarty.server.PHP_SELF}?{if $view}view={$view}&amp;{/if}page={$nextpage}{else}#{/if}" class="btn btn-default {if !$nextpage}disabled{/if}">{$LANG.nextpage} &gt;</a>
</div>

{if $servers}

    {include file="$template/includes/subheader.tpl" title=$LANG.serverstatustitle}

    <p>{$LANG.serverstatusheadingtext}</p>

    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>{$LANG.servername}</th>
                    <th class="text-center">HTTP</th>
                    <th class="text-center">FTP</th>
                    <th class="text-center">POP3</th>
                    <th class="text-center">{$LANG.serverstatusphpinfo}</th>
                    <th class="text-center">{$LANG.serverstatusserverload}</th>
                    <th class="text-center">{$LANG.serverstatusuptime}</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$servers key=num item=server}
                    <tr>
                        <td>{$server.name}</td>
                        <td class="text-center" id="port80_{$num}">
                            <span class="fa fa-spinner fa-spin"></span>
                        </td>
                        <td class="text-center" id="port21_{$num}">
                            <span class="fa fa-spinner fa-spin"></span>
                        </td>
                        <td class="text-center" id="port110_{$num}">
                            <span class="fa fa-spinner fa-spin"></span>
                        </td>
                        <td class="text-center"><a href="{$server.phpinfourl}" target="_blank">{$LANG.serverstatusphpinfo}</a></td>
                        <td class="text-center" id="load{$num}">
                            <span class="fa fa-spinner fa-spin"></span>
                        </td>
                        <td class="text-center" id="uptime{$num}">
                            <span class="fa fa-spinner fa-spin"></span>
                            <script>
                            jQuery(document).ready(function() {
                                checkPort({$num}, 80);
                                checkPort({$num}, 21);
                                checkPort({$num}, 110);
                                getStats({$num});
                            });
                            </script>
                        </td>
                    </tr>
                {foreachelse}
                    <tr>
                        <td colspan="7">{$LANG.serverstatusnoservers}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>

{/if}
