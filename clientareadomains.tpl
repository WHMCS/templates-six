{if $warnings}
    {include file="$template/includes/alert.tpl" type="warning" msg=$warnings textcenter=true}
{/if}
<div class="tab-content">
    <div class="tab-pane fade in active" id="tabOverview">
        {include file="$template/includes/tablelist.tpl" tableName="DomainsList" noSortColumns="0, 6" startOrderCol="1" filterColumn="5"}
        <script type="text/javascript">
            jQuery(document).ready( function ()
            {
                var table = jQuery('#tableDomainsList').removeClass('hidden').DataTable();
                {if $orderby == 'domain'}
                    table.order(1, '{$sort}');
                {elseif $orderby == 'regdate' || $orderby == 'registrationdate'}
                    table.order(2, '{$sort}');
                {elseif $orderby == 'nextduedate'}
                    table.order(3, '{$sort}');
                {elseif $orderby == 'autorenew'}
                    table.order(4, '{$sort}');
                {elseif $orderby == 'status'}
                    table.order(5, '{$sort}');
                {/if}
                table.draw();
                jQuery('#tableLoading').addClass('hidden');
            });
        </script>
        <form id="domainForm" method="post" action="clientarea.php?action=bulkdomain">
            <input id="bulkaction" name="update" type="hidden" />

            <div class="table-container clearfix">
                <table id="tableDomainsList" class="table table-list hidden">
                    <thead>
                        <tr>
                            <th width="20"></th>
                            <th>{$LANG.orderdomain}</th>
                            <th>{$LANG.regdate}</th>
                            <th>{$LANG.nextdue}</th>
                            <th>{$LANG.domainsautorenew}</th>
                            <th>{$LANG.domainstatus}</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                    {foreach key=num item=domain from=$domains}
                        <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=domaindetails&amp;id={$domain.id}', false)">
                            <td>
                                <input type="checkbox" name="domids[]" class="domids stopEventBubble" value="{$domain.id}" />
                            </td>
                            <td><a href="http://{$domain.domain}" target="_blank">{$domain.domain}</a></td>
                            <td><span class="hidden">{$domain.normalisedRegistrationDate}</span>{$domain.registrationdate}</td>
                            <td><span class="hidden">{$domain.normalisedNextDueDate}</span>{$domain.nextduedate}</td>
                            <td>
                                {if $domain.autorenew}
                                    <i class="fa fa-fw fa-check text-success"></i> {$LANG.domainsautorenewenabled}
                                {else}
                                    <i class="fa fa-fw fa-times text-danger"></i> {$LANG.domainsautorenewdisabled}
                                {/if}
                            </td>
                            <td>
                                <span class="label status status-{$domain.statusClass}">{$domain.statustext}</span>
                                <span class="hidden">
                                    {if $domain.next30}<span>{$LANG.domainsExpiringInTheNext30Days}</span><br />{/if}
                                    {if $domain.next90}<span>{$LANG.domainsExpiringInTheNext90Days}</span><br />{/if}
                                    {if $domain.next180}<span>{$LANG.domainsExpiringInTheNext180Days}</span><br />{/if}
                                    {if $domain.after180}<span>{$LANG.domainsExpiringInMoreThan180Days}</span>{/if}
                                </span>
                            </td>
                            <td>
                                <div class="btn-group btn-group-sm" style="width:60px;">
                                    <a href="clientarea.php?action=domaindetails&id={$domain.id}" class="btn btn-default"><i class="fa fa-wrench"></i></a>
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu text-left" role="menu">
                                        {if $domain.status eq 'Active'}
                                            <li><a href="clientarea.php?action=domaindetails&id={$domain.id}#tabNameservers"><i class="glyphicon glyphicon-globe"></i> {$LANG.domainmanagens}</a></li>
                                            <li><a href="clientarea.php?action=domaincontacts&domainid={$domain.id}"><i class="glyphicon glyphicon-user"></i> {$LANG.domaincontactinfoedit}</a></li>
                                            <li><a href="clientarea.php?action=domaindetails&id={$domain.id}#tabAutorenew"><i class="glyphicon glyphicon-globe"></i> {$LANG.domainautorenewstatus}</a></li>
                                            <li class="divider"></li>
                                        {/if}
                                        <li><a href="clientarea.php?action=domaindetails&id={$domain.id}"><i class="glyphicon glyphicon-pencil"></i> {$LANG.managedomain}</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                </table>
                <div class="text-center" id="tableLoading">
                    <p><i class="fa fa-spinner fa-spin"></i> {$LANG.loading}</p>
                </div>
            </div>
        </form>

        <div class="btn-group margin-bottom">
            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
                <span class="glyphicon glyphicon-folder-open"></span> &nbsp; {$LANG.withselected} <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#" id="nameservers" class="setBulkAction"><i class="glyphicon glyphicon-globe"></i> {$LANG.domainmanagens}</a></li>
                <li><a href="#" id="autorenew" class="setBulkAction"><i class="glyphicon glyphicon-refresh"></i> {$LANG.domainautorenewstatus}</a></li>
                <li><a href="#" id="reglock" class="setBulkAction"><i class="glyphicon glyphicon-lock"></i> {$LANG.domainreglockstatus}</a></li>
                <li><a href="#" id="contactinfo" class="setBulkAction"><i class="glyphicon glyphicon-user"></i> {$LANG.domaincontactinfoedit}</a></li>
            </ul>
        </div>
    </div>
    <div class="tab-pane fade in" id="tabRenew">
        {include file="$template/includes/tablelist.tpl" tableName="RenewalsList" noSortColumns="3, 4, 5" startOrderCol="0" filterColumn="1" dontControlActiveClass=true}
        <script type="text/javascript">
            var observer = new MutationObserver(function(mutations) {
                jQuery('#Secondary_Sidebar-My_Domains_Actions-Renew_Domain').toggleClass('active')
            });
            var target = document.querySelector('#tabRenew');
            observer.observe(target, {
                attributes: true
            });

        </script>
        <div class="table-container clearfix">
            <table id="tableRenewalsList" class="table table-list">
                <thead>
                    <tr>
                        <th>{$LANG.orderdomain}</th>
                        <th>{$LANG.domainstatus}</th>
                        <th>{$LANG.clientareadomainexpirydate}</th>
                        <th>{$LANG.domaindaysuntilexpiry}</th>
                        <th>&nbsp;</th>
                        <th>
                            <div id="btnCheckout" style="display:none;">
                                <a href="cart.php?a=view" class="btn btn-default">{$LANG.domainsgotocheckout} &raquo;</a>
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $renewals as $id => $renewal}
                        <tr id="domainRow{$renewal.id}" {if $selectedIDs && in_array($renewal.id, $selectedIDs)}class="highlight"{/if}>
                            <td id="domain{$renewal.id}">{$renewal.domain}</td>
                            <td id="status{$renewal.id}">
                                <span class="label status status-{$renewal.statusClass}">{$renewal.status}</span>
                                <span class="hidden">
                                    {if $renewal.next30}<span>{$LANG.domainsExpiringInTheNext30Days}</span><br />{/if}
                                    {if $renewal.next90}<span>{$LANG.domainsExpiringInTheNext90Days}</span><br />{/if}
                                    {if $renewal.next180}<span>{$LANG.domainsExpiringInTheNext180Days}</span><br />{/if}
                                    {if $renewal.after180}<span>{$LANG.domainsExpiringInMoreThan180Days}</span>{/if}
                                </span>
                            </td>
                            <td id="expiry{$renewal.id}"><span class="hidden">{$renewal.normalisedExpiryDate}</span>{$renewal.expiryDate}</td>
                            <td id="days{$renewal.id}" class="text-center">
                                {if $renewal.daysUntilExpiry > 30}
                                    <span class="text-success">{$renewal.daysUntilExpiry} {$LANG.domainrenewalsdays}</span>
                                {elseif $renewal.daysUntilExpiry > 0}
                                    <span class="text-warning">{$renewal.daysUntilExpiry} {$LANG.domainrenewalsdays}</span>
                                {else}
                                    <span class="text-danger">{$renewal.daysUntilExpiry*-1} {$LANG.domainrenewalsdaysago}</span>
                                {/if}
                                {if $renewal.inGracePeriod}
                                    <br />
                                    <span class="text-danger">{$LANG.domainrenewalsingraceperiod}</span>
                                {/if}
                            </td>
                            <td id="period{$renewal.id}" class="text-center">
                                {if $renewal.beforeRenewLimit}
                                    <span class="text-danger">
                                        {$LANG.domainrenewalsbeforerenewlimit|sprintf2:$renewal.beforeRenewLimitDays}
                                    </span>
                                {elseif $renewal.pastGracePeriod}
                                    <span class="textred">{$LANG.domainrenewalspastgraceperiod}</span>
                                {else}
                                    <select id="renewalPeriod{$renewal.id}" name="renewalPeriod[{$renewal.id}]">
                                        {foreach $renewal.renewalOptions as $renewalOption}
                                            <option value="{$renewalOption.period}">
                                                {$renewalOption.period} {$LANG.orderyears} @ {$renewalOption.price}
                                            </option>
                                        {/foreach}
                                    </select>
                                {/if}
                            </td>
                            <td class="text-center">
                                {if !$renewal.beforeRenewLimit && !$renewal.pastGracePeriod}
                                    <button type="button" class="btn btn-primary btn-sm" id="renewButton{$renewal.id}" onclick="addRenewalToCart({$renewal.id}, this)">
                                        <span class="glyphicon glyphicon-shopping-cart"></span> {$LANG.addtocart}
                                    </button>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>

        <div class="row">
            <div class="col-xs-12" id="backLink">
                <a href="#tabOverview" class="btn btn-default btn-sm" data-toggle="tab" id="back">
                    <i class="glyphicon glyphicon-backward"></i> {$LANG.clientareabacklink|replace:'&laquo; ':''}
                </a>
            </div>
        </div>
    </div>
</div>
