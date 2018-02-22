<div class="domain-pricing">

    <h4>{lang key='pricing.browseExtByCategory'}</h4>

    <div class="tld-filters">
        {foreach $categories as $category => $count}
            <a href="#" data-category="{$category}" class="label label-default">{lang key="domainTldCategory.$category" defaultValue=$category} ({$count})</a>
        {/foreach}
    </div>

    <div class="row tld-pricing-header text-center">
        <div class="col-sm-3 no-bg">{lang key='orderdomain'}</div>
        <div class="col-sm-9 no-bg">
            <div class="row no-bg">
                <div class="col-xs-1 no-bg"></div>
                <div class="col-xs-2">{lang key='pricing.register'}</div>
                <div class="col-xs-2">{lang key='pricing.transfer'}</div>
                <div class="col-xs-2">{lang key='pricing.renewal'}</div>
                <div class="col-xs-2">{lang key='gracePeriod'}</div>
                <div class="col-xs-2">{lang key='redemptionPeriod'}</div>
                <div class="col-xs-1 no-bg"></div>
            </div>
        </div>
    </div>
    {foreach $extensions as $order => $extension}
        <div class="row tld-row" data-category="{foreach $extension.top_level.categories as $category}|{$category.category}|{/foreach}">
            <div class="col-sm-3 two-row-center">
                <strong>{$extension.extension}</strong>
                {if $extension.group}
                    <span class="tld-sale-group tld-sale-group-{$extension.group}">{$extension.group}!</span>
                {/if}
            </div>
            <div class="col-sm-9">
                <div class="row">
                    <div class="col-xs-1"></div>
                    {foreach $extension.pricing as $years => $price}
                        <div class="col-xs-2 text-center">
                            {if $price.register >= 0}
                                {$price.register}<br>
                                <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                            {else}
                                <small>N/A</small>
                            {/if}
                        </div>
                        <div class="col-xs-2 text-center">
                            {if $price.transfer >= 0}
                                {$price.transfer}<br>
                                <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                            {else}
                                <small>N/A</small>
                            {/if}
                        </div>
                        <div class="col-xs-2 text-center">
                            {if $price.renew >= 0}
                                {$price.renew}<br>
                                <small>{$years} {if $years > 1}{lang key="orderForm.years"}{else}{lang key="orderForm.year"}{/if}</small>
                            {else}
                                <small>N/A</small>
                            {/if}
                        </div>
                        {break}
                    {/foreach}
                    <div class="col-xs-2 text-center">
                        {if $extension.grace_period_fee != -1}
                            {$extension.grace_period_fee}<br>
                            {if $extension.grace_period >= 0}
                                {$extension.grace_period}
                            {else}
                                {$extension.defaultGracePeriod}
                            {/if} {lang key='domainrenewalsdays'}
                        {else}-{/if}
                    </div>
                    <div class="col-xs-2 text-center">
                        {if $extension.redemption_grace_period_fee != -1}
                            {$extension.redemption_grace_period_fee}<br>
                            {if $extension.redemption_grace_period >= 0}
                                {$extension.redemption_grace_period}
                            {else}
                                {$extension.defaultRedemptionGracePeriod}
                            {/if} {lang key='domainrenewalsdays'}
                        {else}-{/if}
                    </div>
                    <div class="col-xs-1"></div>
                </div>
            </div>
        </div>
    {/foreach}
    <div class="row tld-row no-tlds">
        <div class="col-xs-12 text-center">
            <br>
            {lang key='pricing.selectExtCategory'}
            <br><br>
        </div>
    </div>

</div>

<script>
    jQuery(document).ready(function() {
        jQuery('.tld-filters a:first-child').click();
    });
</script>
