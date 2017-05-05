{if $modulecustombuttonresult}
    {if $modulecustombuttonresult == "success"}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.moduleactionsuccess textcenter=true idname="alertModuleCustomButtonSuccess"}
    {else}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.moduleactionfailed|cat:' ':$modulecustombuttonresult textcenter=true idname="alertModuleCustomButtonFailed"}
    {/if}
{/if}

{if $pendingcancellation}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.cancellationrequestedexplanation textcenter=true idname="alertPendingCancellation"}
{/if}

<div class="tab-content margin-bottom">
    <div class="tab-pane fade in active" id="tabOverview">

        {if $tplOverviewTabOutput}
            {$tplOverviewTabOutput}
        {else}

            <div class="product-details clearfix">

                <div class="row">
                    <div class="col-md-6">

                        <div class="product-status product-status-{$rawstatus|strtolower}">
                            <div class="product-icon text-center">
                                <span class="fa-stack fa-lg">
                                    <i class="fa fa-circle fa-stack-2x"></i>
                                    <i class="fa fa-{if $type eq "hostingaccount" || $type == "reselleraccount"}hdd-o{elseif $type eq "server"}database{else}archive{/if} fa-stack-1x fa-inverse"></i>
                                </span>
                                <h3>{$product}</h3>
                                <h4>{$groupname}</h4>
                            </div>
                            <div class="product-status-text">
                                {$status}
                            </div>
                        </div>

                        {if $showcancelbutton || $packagesupgrade}
                            <div class="row">
                                {if $packagesupgrade}
                                    <div class="col-xs-{if $showcancelbutton}6{else}12{/if}">
                                        <a href="upgrade.php?type=package&amp;id={$id}" class="btn btn-block btn-success">{$LANG.upgrade}</a>
                                    </div>
                                {/if}
                                {if $showcancelbutton}
                                    <div class="col-xs-{if $packagesupgrade}6{else}12{/if}">
                                        <a href="clientarea.php?action=cancel&amp;id={$id}" class="btn btn-block btn-danger {if $pendingcancellation}disabled{/if}">{if $pendingcancellation}{$LANG.cancellationrequested}{else}{$LANG.clientareacancelrequestbutton}{/if}</a>
                                    </div>
                                {/if}
                            </div>
                        {/if}

                    </div>
                    <div class="col-md-6 text-center">

                        <h4>{$LANG.clientareahostingregdate}</h4>
                        {$regdate}

                        {if $firstpaymentamount neq $recurringamount}
                            <h4>{$LANG.firstpaymentamount}</h4>
                            {$firstpaymentamount}
                        {/if}

                        {if $billingcycle != $LANG.orderpaymenttermonetime && $billingcycle != $LANG.orderfree}
                            <h4>{$LANG.recurringamount}</h4>
                            {$recurringamount}
                        {/if}

                        <h4>{$LANG.orderbillingcycle}</h4>
                        {$billingcycle}

                        <h4>{$LANG.clientareahostingnextduedate}</h4>
                        {$nextduedate}

                        <h4>{$LANG.orderpaymentmethod}</h4>
                        {$paymentmethod}

                        {if $suspendreason}
                            <h4>{$LANG.suspendreason}</h4>
                            {$suspendreason}
                        {/if}

                    </div>
                </div>

            </div>

            {foreach $hookOutput as $output}
                <div>
                    {$output}
                </div>
            {/foreach}

            {if $domain || $moduleclientarea || $configurableoptions || $customfields || $lastupdate}
                <div class="row clearfix">
                    <div class="col-xs-12">
                        <ul class="nav nav-tabs nav-tabs-overflow">
                            {if $domain}
                                <li class="active">
                                    <a href="#domain" data-toggle="tab"><i class="fa fa-globe fa-fw"></i> {if $type eq "server"}{$LANG.sslserverinfo}{elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}{$LANG.hostingInfo}{else}{$LANG.clientareahostingdomain}{/if}</a>
                                </li>
                            {elseif $moduleclientarea}
                                <li class="active">
                                    <a href="#manage" data-toggle="tab"><i class="fa fa-globe fa-fw"></i> {$LANG.manage}</a>
                                </li>
                            {/if}
                            {if $configurableoptions}
                                <li{if !$domain && !$moduleclientarea} class="active"{/if}>
                                    <a href="#configoptions" data-toggle="tab"><i class="fa fa-cubes fa-fw"></i> {$LANG.orderconfigpackage}</a>
                                </li>
                            {/if}
                            {if $customfields}
                                <li{if !$domain && !$moduleclientarea && !$configurableoptions} class="active"{/if}>
                                    <a href="#additionalinfo" data-toggle="tab"><i class="fa fa-info fa-fw"></i> {$LANG.additionalInfo}</a>
                                </li>
                            {/if}
                            {if $lastupdate}
                                <li{if !$domain && !$moduleclientarea && !$configurableoptions && !$customfields} class="active"{/if}>
                                    <a href="#resourceusage" data-toggle="tab"><i class="fa fa-inbox fa-fw"></i> {$LANG.resourceUsage}</a>
                                </li>
                            {/if}
                        </ul>
                    </div>
                </div>
                <div class="tab-content product-details-tab-container">
                    {if $domain}
                        <div class="tab-pane fade in active text-center" id="domain">
                            {if $type eq "server"}
                                <div class="row">
                                    <div class="col-sm-5 text-right">
                                        <strong>{$LANG.serverhostname}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$domain}
                                    </div>
                                </div>
                                {if $dedicatedip}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{$LANG.primaryIP}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$dedicatedip}
                                        </div>
                                    </div>
                                {/if}
                                {if $assignedips}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{$LANG.assignedIPs}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$assignedips|nl2br}
                                        </div>
                                    </div>
                                {/if}
                                {if $ns1 || $ns2}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{$LANG.domainnameservers}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$ns1}<br />{$ns2}
                                        </div>
                                    </div>
                                {/if}
                            {elseif ($type eq "hostingaccount" || $type eq "reselleraccount") && $serverdata}
                                {if $domain}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{$LANG.orderdomain}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$domain}&nbsp;<a href="http://{$domain}" target="_blank" class="btn btn-default btn-xs" >{$LANG.visitwebsite}</a>
                                        </div>
                                    </div>
                                {/if}
                                {if $username}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{$LANG.serverusername}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {$username}
                                        </div>
                                    </div>
                                {/if}
                                <div class="row">
                                    <div class="col-sm-5 text-right">
                                        <strong>{$LANG.servername}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$serverdata.hostname}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-5 text-right">
                                        <strong>{$LANG.domainregisternsip}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$serverdata.ipaddress}
                                    </div>
                                </div>
                                {if $serverdata.nameserver1 || $serverdata.nameserver2 || $serverdata.nameserver3 || $serverdata.nameserver4 || $serverdata.nameserver5}
                                    <div class="row">
                                        <div class="col-sm-5 text-right">
                                            <strong>{$LANG.domainnameservers}</strong>
                                        </div>
                                        <div class="col-sm-7 text-left">
                                            {if $serverdata.nameserver1}{$serverdata.nameserver1} ({$serverdata.nameserver1ip})<br />{/if}
                                            {if $serverdata.nameserver2}{$serverdata.nameserver2} ({$serverdata.nameserver2ip})<br />{/if}
                                            {if $serverdata.nameserver3}{$serverdata.nameserver3} ({$serverdata.nameserver3ip})<br />{/if}
                                            {if $serverdata.nameserver4}{$serverdata.nameserver4} ({$serverdata.nameserver4ip})<br />{/if}
                                            {if $serverdata.nameserver5}{$serverdata.nameserver5} ({$serverdata.nameserver5ip})<br />{/if}
                                        </div>
                                    </div>
                                {/if}
                            {else}
                                <p>
                                    {$domain}
                                </p>
                                <p>
                                    <a href="http://{$domain}" class="btn btn-default" target="_blank">{$LANG.visitwebsite}</a>
                                    {if $domainId}
                                        <a href="clientarea.php?action=domaindetails&id={$domainId}" class="btn btn-default" target="_blank">{$LANG.managedomain}</a>
                                    {/if}
                                    <input type="button" onclick="popupWindow('whois.php?domain={$domain}','whois',650,420);return false;" value="{$LANG.whoisinfo}" class="btn btn-default" />
                                </p>
                            {/if}
                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                    {elseif $moduleclientarea}
                        <div class="tab-pane fade{if !$domain} in active{/if} text-center" id="manage">
                            {if $moduleclientarea}
                                <div class="text-center module-client-area">
                                    {$moduleclientarea}
                                </div>
                            {/if}
                        </div>
                    {/if}
                    {if $configurableoptions}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea} in active{/if} text-center" id="configoptions">
                            {foreach from=$configurableoptions item=configoption}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$configoption.optionname}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {if $configoption.optiontype eq 3}{if $configoption.selectedqty}{$LANG.yes}{else}{$LANG.no}{/if}{elseif $configoption.optiontype eq 4}{$configoption.selectedqty} x {$configoption.selectedoption}{else}{$configoption.selectedoption}{/if}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $customfields}
                        <div class="tab-pane fade{if !$domain && !$moduleclientarea && !$configurableoptions} in active{/if} text-center" id="additionalinfo">
                            {foreach from=$customfields item=field}
                                <div class="row">
                                    <div class="col-sm-5">
                                        <strong>{$field.name}</strong>
                                    </div>
                                    <div class="col-sm-7 text-left">
                                        {$field.value}
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                    {if $lastupdate}
                        <div class="tab-pane fade text-center" id="resourceusage">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="col-sm-6">
                                    <h4>{$LANG.diskSpace}</h4>
                                    <input type="text" value="{$diskpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                    <p>{$diskusage}MB / {$disklimit}MB</p>
                                </div>
                                <div class="col-sm-6">
                                    <h4>{$LANG.bandwidth}</h4>
                                    <input type="text" value="{$bwpercent|substr:0:-1}" class="dial-usage" data-width="100" data-height="100" data-min="0" data-readOnly="true" />
                                    <p>{$bwusage}MB / {$bwlimit}MB</p>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <p class="text-muted">{$LANG.clientarealastupdated}: {$lastupdate}</p>

                            <script src="{$BASE_PATH_JS}/jquery.knob.js"></script>
                            <script type="text/javascript">
                            jQuery(function() {ldelim}
                                jQuery(".dial-usage").knob({ldelim}'format':function (v) {ldelim} alert(v); {rdelim}{rdelim});
                            {rdelim});
                            </script>
                        </div>
                    {/if}
                </div>
            {/if}
            <script src="{$BASE_PATH_JS}/bootstrap-tabdrop.js"></script>
            <script type="text/javascript">
                jQuery('.nav-tabs-overflow').tabdrop();
            </script>

        {/if}

    </div>
    <div class="tab-pane fade in" id="tabDownloads">

        <h3>{$LANG.downloadstitle}</h3>

        {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductDownloadsAvailable"}" textcenter=true}

        <div class="row">
            {foreach from=$downloads item=download}
                <div class="col-xs-10 col-xs-offset-1">
                    <h4>{$download.title}</h4>
                    <p>
                        {$download.description}
                    </p>
                    <p>
                        <a href="{$download.link}" class="btn btn-default"><i class="fa fa-download"></i> {$LANG.downloadname}</a>
                    </p>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade in" id="tabAddons">

        <h3>{$LANG.clientareahostingaddons}</h3>

        {if $addonsavailable}
            {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaProductAddonsAvailable"}" textcenter=true}
        {/if}

        <div class="row">
            {foreach from=$addons item=addon}
                <div class="col-xs-10 col-xs-offset-1">
                    <div class="panel panel-default panel-accent-blue">
                        <div class="panel-heading">
                            {$addon.name}
                            <div class="pull-right status-{$addon.rawstatus|strtolower}">{$addon.status}</div>
                        </div>
                        <div class="row panel-body">
                            <div class="col-md-6">
                                <p>
                                    {$addon.pricing}
                                </p>
                                <p>
                                    {$LANG.registered}: {$addon.regdate}
                                </p>
                                <p>
                                    {$LANG.clientareahostingnextduedate}: {$addon.nextduedate}
                                </p>
                            </div>
                        </div>
                        <div class="panel-footer">
                            {$addon.managementActions}
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>

    </div>
    <div class="tab-pane fade in" id="tabChangepw">

        <h3>{$LANG.serverchangepassword}</h3>

        {if $modulechangepwresult}
            {if $modulechangepwresult == "success"}
                {include file="$template/includes/alert.tpl" type="success" msg=$modulechangepasswordmessage textcenter=true}
            {elseif $modulechangepwresult == "error"}
                {include file="$template/includes/alert.tpl" type="error" msg=$modulechangepasswordmessage|strip_tags textcenter=true}
            {/if}
        {/if}

        <form class="form-horizontal using-password-strength" method="post" action="{$smarty.server.PHP_SELF}?action=productdetails#tabChangepw" role="form">
            <input type="hidden" name="id" value="{$id}" />
            <input type="hidden" name="modulechangepassword" value="true" />

            <div id="newPassword1" class="form-group has-feedback">
                <label for="inputNewPassword1" class="col-sm-5 control-label">{$LANG.newpassword}</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="inputNewPassword1" name="newpw" autocomplete="off" />
                    <span class="form-control-feedback glyphicon"></span>
                    {include file="$template/includes/pwstrength.tpl"}
                </div>
            </div>
            <div id="newPassword2" class="form-group has-feedback">
                <label for="inputNewPassword2" class="col-sm-5 control-label">{$LANG.confirmnewpassword}</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="inputNewPassword2" name="confirmpw" autocomplete="off" />
                    <span class="form-control-feedback glyphicon"></span>
                    <div id="inputNewPassword2Msg">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-6 col-sm-6">
                    <input class="btn btn-primary" type="submit" value="{$LANG.clientareasavechanges}" />
                    <input class="btn" type="reset" value="{$LANG.cancel}" />
                </div>
            </div>

        </form>

    </div>
</div>
