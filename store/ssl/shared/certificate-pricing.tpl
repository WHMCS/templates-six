<div class="content-block certificate-options {$type}">
    <div class="container">

        <h3 class="pull-left">{lang key='store.ssl.shared.pricing'}</h3>

        {include file="$template/store/ssl/shared/currency-chooser.tpl"}

        <div class="clearfix"></div>

        <br>

        <div class="row">
            <div class="{if count($certificates.$type) == 1}col-md-6 col-md-offset-3{elseif count($certificates.$type) == 2}col-md-10 col-md-offset-1{else}col-sm-12{/if}">
                <div class="row row-pricing-table">
                    <div class="col-sm-{if count($certificates.$type) == 1}6{elseif count($certificates.$type) == 2}4{else}3{/if} sidebar hidden-xs">
                        <div class="header"></div>
                        <ul>
                            <li>{lang key='store.ssl.shared.encryption256'}</li>
                            <li>{lang key='store.ssl.shared.issuanceTime'}</li>
                            <li>{lang key='store.ssl.shared.greatFor'}</li>
                            <li>{lang key='store.ssl.shared.warrantyValue'}</li>
                            <li>{lang key='store.ssl.shared.siteSeal'}</li>
                            <li>{lang key='store.ssl.shared.freeReissues'}</li>
                            <li>{lang key='store.ssl.shared.browserSupport'}</li>
                            <li>{lang key='store.ssl.shared.oneYear'}</li>
                            <li>{lang key='store.ssl.shared.twoYears'}</li>
                        </ul>
                    </div>
                    {if count($certificates.$type) > 0}
                        {foreach $certificates.$type as $product}
                            <div class="col-sm-{if count($certificates.$type) == 1}6{elseif count($certificates.$type) == 2}4{else}3{/if}">
                                <div class="header">
                                    <h4>{$product->name}</h4>
                                </div>
                                <ul>
                                    <li><i class="fas fa-check"></i></li>
                                    <li>{$certificateFeatures.{$product->configoption1}.issuance}</li>
                                    <li>{$certificateFeatures.{$product->configoption1}.for}</li>
                                    <li>USD ${$certificateFeatures.{$product->configoption1}.warranty}</li>
                                    <li><i class="fas fa-check"></i></li>
                                    <li><i class="fas fa-check"></i></li>
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
                                {lang key='store.ssl.shared.noProducts'}
                            </div>
                        </div>
                    {/if}
                </div>
                <br>
                <div class="row">
                    <div class="{if count($certificates.$type) == 1}col-sm-6 col-sm-offset-6{elseif count($certificates.$type) == 2}col-sm-8 col-sm-offset-4{else}col-sm-9 col-sm-offset-3{/if} text-center">
                        <a href="{routePath('store-ssl-certificates-index')}#helpmechoose" class="help-me-choose">
                            <i class="fas fa-question-circle"></i>
                            {lang key='store.ssl.shared.helpMeChoose'}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
