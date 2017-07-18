<div class="content-block certificate-options {$type}">
    <div class="container">

        <h3 class="pull-left">Certificate Pricing</h3>

        {include file="$template/store/ssl/shared/currency-chooser.tpl"}

        <div class="clearfix"></div>

        <br>

        <div class="row">
            <div class="{if count($certificates.$type) == 1}col-md-6 col-md-offset-3{elseif count($certificates.$type) == 2}col-md-10 col-md-offset-1{else}col-sm-12{/if}">
                <div class="row row-pricing-table">
                    <div class="col-sm-{if count($certificates.$type) == 1}6{elseif count($certificates.$type) == 2}4{else}3{/if} sidebar hidden-xs">
                        <div class="header"></div>
                        <ul>
                            {foreach current($certificateFeatures) as $key => $feature}
                                <li>
                                    {$key}
                                </li>
                            {/foreach}
                            <li>1 Year</li>
                            <li>2 Years</li>
                            <li>3 Years</li>
                        </ul>
                    </div>
                    {foreach $certificates.$type as $product}
                        <div class="col-sm-{if count($certificates.$type) == 1}6{elseif count($certificates.$type) == 2}4{else}3{/if}">
                            <div class="header">
                                <h4>{$product->name}</h4>
                            </div>
                            <ul>
                                {foreach $certificateFeatures.{$product->configoption1} as $key => $feature}
                                    <li>
                                        {if is_bool($feature)}
                                            <i class="fa fa-{if $feature}check{else}times{/if}"></i>
                                        {else}
                                            {$feature}
                                        {/if}
                                    </li>
                                {/foreach}

                                {if $product->pricing()->annual()}
                                    <li class="price 1yr">{$product->pricing()->annual()->yearlyPrice()}</li>
                                {else}
                                    <li class="price 1yr na">-</li>
                                {/if}
                                {if $product->pricing()->biennial()}
                                    <li class="price 2yr">{$product->pricing()->biennial()->yearlyPrice()}</li>
                                {else}
                                    <li class="price 2yr na">-</li>
                                {/if}
                                {if $product->pricing()->triennial()}
                                    <li class="price 3yr">{$product->pricing()->triennial()->yearlyPrice()}</li>
                                {else}
                                    <li class="price 3yr na">-</li>
                                {/if}
                            </ul>
                            <form method="post" action="{routePath('store-order')}">
                                <input type="hidden" name="pid" value="{$product->id}">
                                <button type="submit" class="btn btn-block">Buy Now</button>
                            </form>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
    </div>
</div>
