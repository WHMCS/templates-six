{include file="$template/includes/alert.tpl" type="danger" msg="{$LANG.searchtermrequired}" textcenter=true idname="searchTermRequired" additionalClasses="domain-checker-error" hide=true}

{include file="$template/includes/alert.tpl" type="danger" msg="{$LANG.invalidchars}" textcenter=true idname="invalidChars" additionalClasses="domain-checker-error" hide=true}

{if $errorMsg}
    {include file="$template/includes/alert.tpl" type="danger" msg=$errorMsg textcenter=true idname="invalidDomainError" additionalClasses="domain-checker-error"}
{else}
    {include file="$template/includes/alert.tpl" type="danger" msg="{$LANG.unabletolookup}" textcenter=true idname="invalidDomainError" additionalClasses="domain-checker-error" hide=true}
{/if}

<div class="domain-checker-container">
    <div class="domain-checker-bg clearfix">
        <form id="frmDomainChecker">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                    {if $bulkdomainsearchenabled}
                        <div class="domain-bulk-options-box hidden-xs">
                            <a href="domainchecker.php?search=bulk" id="btnBulkOptions" class="btn btn-warning btn-sm">{$LANG.bulkoptions}</a>
                        </div>
                    {/if}
                    <div class="input-group input-group-lg input-group-box">
                        <input type="text" class="form-control" placeholder="{$LANG.findyourdomain}" value="{$domain}" id="inputDomain" />
                        <span class="input-group-btn">
                            <button type="submit" id="btnCheckAvailability" class="btn btn-primary domain-check-availability">{$LANG.search}</button>
                        </span>
                    </div>
                </div>
            </div>

            {include file="$template/includes/captcha.tpl"}
        </form>
    </div>
</div>
<div class="domain-step-options hidden" id="stepBulkOptions">
    <textarea class="form-control" rows="10" cols="60" id="inputBulkDomains"></textarea>
</div>
<div class="domain-step-options{if !$performingLookup} hidden{/if}" id="stepResults">
    {include file="$template/domainchecker-results.tpl"}
</div>

{if !$loggedin && $currencies && !$performingLookup}
    <div class="currencychooser pull-right clearfix margin-bottom">
        <div class="btn-group" role="group">
            {foreach from=$currencies item=curr}
                <a href="domainchecker.php?currency={$curr.id}" class="btn btn-default{if $currency.id eq $curr.id} active{/if}">
                    <img src="{$BASE_PATH_IMG}/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" />
                    {$curr.code}
                </a>
            {/foreach}
        </div>
    </div>
    <div class="clearfix"></div>
{/if}

<div id="pricingTable"{if $performingLookup} class="hidden"{/if}>

    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        {foreach $tldcategories as $tldCategory}
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="heading{$tldCategory->id}">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse{$tldCategory->id}" aria-expanded="{if $tldCategory@first}true{else}false{/if}" aria-controls="collapse{$tldCategory->id}" class="domain-tld-pricing-category">
                            {$tldCategory->category} {$LANG.tldpricing}
                        </a>
                    </h4>
                </div>
                <div id="collapse{$tldCategory->id}" class="panel-collapse collapse{if $tldCategory@first} in{/if}" role="tabpanel" aria-labelledby="heading{$tldCategory->id}">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2 table-responsive domain-tld-pricing-table-responsive">
                                <table class="table table-striped table-framed">
                                    <thead>
                                        <tr>
                                            <th class="text-center">{$LANG.domaintld}</th>
                                            <th class="text-center">{$LANG.domainminyears}</th>
                                            <th class="text-center">{$LANG.domainsregister}</th>
                                            <th class="text-center">{$LANG.domainstransfer}</th>
                                            <th class="text-center">{$LANG.domainsrenew}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {foreach $tldCategory->topLevelDomains as $tld}
                                            <tr>
                                                <td>{$tld->tld}</td>
                                                <td class="text-center">{$tldpricing.{$tld->tld}.period}</td>
                                                <td class="text-center">{if $tldpricing.{$tld->tld}.register}{$tldpricing.{$tld->tld}.register}{else}{$LANG.domainregnotavailable}{/if}</td>
                                                <td class="text-center">{if $tldpricing.{$tld->tld}.transfer}{$tldpricing.{$tld->tld}.transfer}{else}{$LANG.domainregnotavailable}{/if}</td>
                                                <td class="text-center">{if $tldpricing.{$tld->tld}.renew}{$tldpricing.{$tld->tld}.renew}{else}{$LANG.domainregnotavailable}{/if}</td>
                                            </tr>
                                        {/foreach}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading{$tldCategory->id}">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseAll" aria-expanded="false" aria-controls="collapseAll" class="domain-tld-pricing-category">
                        {$LANG.alltldpricing}
                    </a>
                </h4>
            </div>
            <div id="collapseAll" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingAll">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2 table-responsive domain-tld-pricing-table-responsive">
                            <table class="table table-striped table-framed">
                                <thead>
                                    <tr>
                                        <th class="text-center">{$LANG.domaintld}</th>
                                        <th class="text-center">{$LANG.domainminyears}</th>
                                        <th class="text-center">{$LANG.domainsregister}</th>
                                        <th class="text-center">{$LANG.domainstransfer}</th>
                                        <th class="text-center">{$LANG.domainsrenew}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $tldpricelist as $tld}
                                        <tr>
                                            <td>{$tld.tld}</td>
                                            <td class="text-center">{$tld.period}</td>
                                            <td class="text-center">{if $tld.register}{$tld.register}{else}{$LANG.domainregnotavailable}{/if}</td>
                                            <td class="text-center">{if $tld.transfer}{$tld.transfer}{else}{$LANG.domainregnotavailable}{/if}</td>
                                            <td class="text-center">{if $tld.renew}{$tld.renew}{else}{$LANG.domainregnotavailable}{/if}</td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

{if !$loggedin && $currencies && !$performingLookup}
    <div class="currencychooser pull-right clearfix margin-bottom">
        <div class="btn-group" role="group">
            {foreach from=$currencies item=curr}
                <a href="domainchecker.php?currency={$curr.id}" class="btn btn-default{if $currency.id eq $curr.id} active{/if}">
                    <img src="{$BASE_PATH_IMG}/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" />
                    {$curr.code}
                </a>
            {/foreach}
        </div>
    </div>
    <div class="clearfix"></div>
{/if}

<script>
var langSearch = '{$LANG.search}';
var langAdding = '{$LANG.domaincheckeradding}';
var langAdded = '{$LANG.domaincheckeradded}';
var langUnavailable = '{$LANG.domainunavailable}';
var langBulkPlaceholder = '{$LANG.domaincheckerbulkplaceholder|escape:'quotes'|replace:"\n":'\n'}';
</script>
<script src="templates/{$template}/js/domainchecker.js"></script>

{include file="$template/includes/modal.tpl" name="CheckUnavailable" title="{$LANG.domainchecker.suggestiontakentitle}" content="{$LANG.domainchecker.suggestiontakenmsg}" closeLabel="{$LANG.domainchecker.suggestiontakenchooseanother}"}

{include file="$template/includes/modal.tpl" name="AlreadyInCart" title="{$LANG.domainchecker.alreadyincarttitle}" content="{$LANG.domainchecker.alreadyincartmsg}" submitAction="window.location='cart.php?a=checkout'" submitLabel="{$LANG.domainchecker.alreadyincartcheckoutnow}"}

{include file="$template/includes/modal.tpl" name="AddToCartError" title="{$LANG.genericerror.title}" content="{$LANG.genericerror.msg}"}
