<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="container">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">

            <div class="sitebuilder-upgrade-container">

                <div class="row">
                    <div class="col-sm-6">

                        <div class="content-padded">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/sitebuilder/logo.png">
                            <h2>{lang key="store.siteBuilder.upgrade.required"}</h2>
                            <p>{lang key="store.siteBuilder.upgrade.requiredDescription"}</p>
                            {if $loggedin}
                                <p>{lang key="store.siteBuilder.upgrade.recommended"}</p>
                            {else}
                                <p>{lang key="store.siteBuilder.upgrade.login"}</p>
                            {/if}
                        </div>

                    </div>
                    <div class="col-sm-6">

                        <div class="promo-wrapper">
                            {if count($siteBuilderServices) > 0}
                                {if is_null($product)}
                                    <h3>{lang key="store.siteBuilder.upgrade.no"}</h3>
                                    <p>{lang key="store.siteBuilder.upgrade.noUpgrade"}</p>
                                    <p><a href="submitticket.php">{lang key="store.siteBuilder.upgrade.submitTicket"}</a></p>
                                {else}
                                    <h3 class="text-center">{$promo->getHeadline()}</h3>
                                    <h4 class="text-center">{$promo->getTagline()}</h4>
                                    {if $promo->hasFeatures()}
                                        <ul>
                                            {foreach $promo->getFeatures() as $feature}
                                                <li>{$feature}</li>
                                            {/foreach}
                                        </ul>
                                    {/if}
                                    <form method="post" action="{routePath('cart-site-builder-upgrade-order')}">
                                        <select name="service" class="form-control sitebuilder-service-select{if count($siteBuilderServices) == 1} hidden{/if}">
                                            {foreach $siteBuilderServices as $service}
                                                <option value="{$service.type}-{$service.id}">{$service.domain}</option>
                                            {/foreach}
                                        </select>
                                        <button type="submit" class="btn btn-success btn-block">
                                            {lang key="store.siteBuilder.upgrade.to" product=$product->name amount=$product->pricing()->first()->breakdownPrice()}
                                        </button>
                                    </form>
                                {/if}
                            {else}
                                <h3>{lang key="store.siteBuilder.upgrade.noPlans"}</h3>
                                <p>{lang key="store.siteBuilder.upgrade.loggedInAs" email=$loggedinuser.email}</p>
                                <p><a href="logout.php?redirect=cart-site-builder-upgrade">{lang key="store.siteBuilder.upgrade.switchUser"}</a></p>
                            {/if}
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
