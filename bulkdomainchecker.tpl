{if $bulkdomainsearchenabled}
<div class="pull-right btn-group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        {$LANG.domainbulksearch} <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <li><a href="domainchecker.php">{$LANG.domainsimplesearch}</a></li>
        <li><a href="domainchecker.php?search=bulkregister">{$LANG.domainbulksearch}</a></li>
        <li><a href="domainchecker.php?search=bulktransfer">{$LANG.domainbulktransfersearch}</a></li>
    </ul>
</div>
{/if}

{if $searchingFor == 'register'}
<p>{$LANG.domainbulksearchintro}</p>
{else}
<p>{$LANG.domainbulktransferdescription}</p>
{/if}

{if $invalidCaptcha}
{include file="$template/includes/alert.tpl" type="danger" msg="{lang key=$invalidCaptchaError}" textcenter=true}
{/if}

<div class="domain-checker-container">
    <div class="domain-checker-bg clearfix">
        <form method="post" action="domainchecker.php?search=bulk{if $searchingFor == 'transfer'}transfer{/if}">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 col-xs-10 col-xs-offset-1">
                    <div class="input-group-box">
                        <textarea name="bulkdomains" id="inputBulkDomains" rows="8" class="form-control margin-bottom-5">{$bulkdomains}</textarea>
                        <button type="submit" id="btnCheckAvailability" class="btn btn-primary btn-block">{$LANG.checkavailability}</button>
                    </div>
                </div>
            </div>

            {include file="$template/includes/captcha.tpl"}
        </form>
    </div>
</div>

{if $invalidDomainsOmitted}
{include file="$template/includes/alert.tpl" type="danger" msg="{$LANG.domaincheckerbulkinvaliddomain}" textcenter=true}
{/if}

{if $bulkCheckResults}
{include file="$template/domainchecker-results.tpl"}
{else}

{if !$loggedin && $currencies && !$performingLookup}
<div class="currencychooser pull-right clearfix margin-bottom">
    <div class="btn-group" role="group">
        {foreach from=$currencies item=curr}
        <a href="domainchecker.php?search=bulk{if $searchingFor == 'transfer'}transfer{/if}&currency={$curr.id}" class="btn btn-default{if $currency.id eq $curr.id} active{/if}">
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
        <div class="panel panel-default">
            <div class="panel-heading" role="tab" id="heading{$tldCategory->id}">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseAll" aria-expanded="false" aria-controls="collapseAll" class="domain-tld-pricing-category">
                        {$LANG.alltldpricing}
                    </a>
                </h4>
            </div>
            <div id="collapseAll" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingAll">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2 table-responsive domain-tld-pricing-table-responsive">
                            <script language="javascript" src = "widgets/domainpricelist.php?currency={$smarty.post.currency}"></script>
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
        <a href="domainchecker.php?search=bulk{if $searchingFor == 'transfer'}transfer{/if}&currency={$curr.id}" class="btn btn-default{if $currency.id eq $curr.id} active{/if}">
            <img src="{$BASE_PATH_IMG}/flags/{if $curr.code eq "AUD"}au{elseif $curr.code eq "CAD"}ca{elseif $curr.code eq "EUR"}eu{elseif $curr.code eq "GBP"}gb{elseif $curr.code eq "INR"}in{elseif $curr.code eq "JPY"}jp{elseif $curr.code eq "USD"}us{elseif $curr.code eq "ZAR"}za{else}na{/if}.png" border="0" alt="" />
            {$curr.code}
        </a>
        {/foreach}
    </div>
</div>
<div class="clearfix"></div>
{/if}

{/if}

<script>
    var langSearch = '{$LANG.search}';
    var langAdding = '{$LANG.domaincheckeradding}';
    var langAdded = '{$LANG.domaincheckeradded}';
    var langUnavailable = '{$LANG.domainunavailable}';
    var langBulkPlaceholder = '{$LANG.domaincheckerbulkplaceholder|escape:'quotes'|replace:"\n":'\n'}';
</script>
<script src="templates/{$template}/js/domainchecker.js"></script>

{include file="$template/includes/modal.tpl" name="Whois" title=$LANG.whoisresults|cat:' <span id="whoisDomainName"></span>'}
