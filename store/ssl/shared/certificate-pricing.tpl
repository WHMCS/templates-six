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
                            <li>256-Bit Encryption</li>
                            <li>Issuance Time</li>
                            <li>Great For</li>
                            <li>Warranty Value</li>
                            <li>Site Seal</li>
                            <li>Free Reissues</li>
                            <li>Browser Support</li>
                            <li>1 Year</li>
                            <li>2 Years</li>
                            <li>3 Years</li>
                        </ul>
                    </div>
                    {if count($certificates.$type) > 0}
                        {foreach $certificates.$type as $product}
                            <div class="col-sm-{if count($certificates.$type) == 1}6{elseif count($certificates.$type) == 2}4{else}3{/if}">
                                <div class="header">
                                    <h4>{$product->name}</h4>
                                </div>
                                <ul>
                                    <li><i class="fa fa-check"></i></li>
                                    <li>{$certificateFeatures.{$product->configoption1}.issuance}</li>
                                    <li>{$certificateFeatures.{$product->configoption1}.for}</li>
                                    <li>USD ${$certificateFeatures.{$product->configoption1}.warranty}</li>
                                    <li><i class="fa fa-check"></i></li>
                                    <li><i class="fa fa-check"></i></li>
                                    <li>99.9%</li>
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
                    {else}
                        <div class="col-xs-9">
                            <div class="lead preview-text">
                                SSL Certificate products you activate will be displayed here
                            </div>
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</div>
