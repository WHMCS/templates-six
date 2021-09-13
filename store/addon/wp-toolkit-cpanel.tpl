<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="wp-toolkit">
    <div class="hero-cta">
        <div class="container">
            <h2>{lang key='store.addon.wptk.redefined1'}</h2>
            <h1>
                {lang key='store.addon.wptk.redefined2'}
                <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/cpanel.png" class="logo">
            </h1>
            <button class="btn btn-success btn-cta" onclick="smoothScroll('#pricing')">
                {lang key='store.addon.wptk.getItNow'}
            </button>
            {if $hasPleskWptk}
                <p>
                    {lang key='store.addon.wptk.switchPlesk'}
                    <a href="{fqdnRoutePath('store-addon', 'plesk-wordpress-toolkit-with-smart-updates')}"
                        >{lang key='clickHere'}</a>
                </p>
            {/if}
        </div>
    </div>

    <div class="hero-image">
        <div class="container">
            <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/feature-laptop.png" class="logo">
        </div>
    </div>

    <div class="body-intro">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <p class="lead">{lang key='store.addon.wptk.introTitle'}</p>
                    <p>{lang key='store.addon.wptk.introBody'}</p>
                </div>
                <div class="col-lg-6">
                    <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/graphic.png" class="d-none d-lg-block">
                </div>
            </div>
        </div>
    </div>

    <div class="features">
        <div class="container">
            <h3>{lang key='store.addon.wptk.midTitle1' breaktag='<br class="d-none d-md-inline-block">'}</h3>
            <div class="row">
                <div class="col-md-6 col-lg-4">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/icon-create.png">
                        <div class="title">{lang key='store.addon.wptk.featureTitle1'}</div>
                        <div class="description">{lang key='store.addon.wptk.featureBody1'}</div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/icon-experiment.png">
                        <div class="title">{lang key='store.addon.wptk.featureTitle2'}</div>
                        <div class="description">{lang key='store.addon.wptk.featureBody2'}</div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/icon-security.png">
                        <div class="title">{lang key='store.addon.wptk.featureTitle3'}</div>
                        <div class="description">{lang key='store.addon.wptk.featureBody3'}</div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/icon-updates.png">
                        <div class="title">{lang key='store.addon.wptk.featureTitle4'}</div>
                        <div class="description">{lang key='store.addon.wptk.featureBody4'}</div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/icon-cloning.png">
                        <div class="title">{lang key='store.addon.wptk.featureTitle5'}</div>
                        <div class="description">{lang key='store.addon.wptk.featureBody5'}</div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="feature-block">
                        <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/icon-maintenance.png">
                        <div class="title">{lang key='store.addon.wptk.featureTitle6'}</div>
                        <div class="description">{lang key='store.addon.wptk.featureBody6'}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pre-screenshots">
        <div class="container">
            <div class="title">{lang key='store.addon.wptk.midTitle2'}</div>
            <div class="row justify-content-center">
                <div class="col-sm-10">
                    {if $firstMatchingAddon && !$firstMatchingAddon->pricing()->first()->isFree()}
                        {lang key='store.addon.wptk.screenshotDesc' price=$firstMatchingAddon->pricing()->first()->price()}
                    {else}
                        {lang key='store.addon.wptk.screenshotDescFree'}
                    {/if}
                </div>
            </div>
        </div>
    </div>
    <div class="screenshots">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <div class="row screenshots-row">
                        <div class="col-md-6">
                            <a href="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-01-full.png" class="screenshot-thumb" data-lightbox="wptoolkit">
                                <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-01.png">
                                <div class="overlay">
                                    <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/zoom.png">
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-02-full.png" class="screenshot-thumb" data-lightbox="wptoolkit">
                                <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-02.png">
                                <div class="overlay">
                                    <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/zoom.png">
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-03-full.png" class="screenshot-thumb" data-lightbox="wptoolkit">
                                <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-03.png">
                                <div class="overlay">
                                    <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/zoom.png">
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-04-full.png" class="screenshot-thumb" data-lightbox="wptoolkit">
                                <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/screen-04.png">
                                <div class="overlay">
                                    <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/zoom.png">
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="pricing" id="pricing">
        <div class="container">
            {if $loggedin && count($clientServices)}
                <div class="starting-from">{lang key='store.addon.wptk.getStartedToday'}</div>
                <div class="subtitle">{lang key='store.addon.wptk.chooseDomains'}</div>
                <div class="service-selector justify-content-center">
                    {foreach $clientServices as $service}
                        <div class="service serviceid-{$service['service']->id}">
                            <div class="inner-content">
                                <div class="product-name truncate">{$service['service']->product->name}</div>
                                <div class="divider"></div>
                                <div class="domain-name truncate">{$service['service']->domain}</div>
                                {if $service['addon']}
                                    <div class="description">{lang key='store.addon.wptk.addAddonFor' addon={$service['addon']->name}}</div>
                                    <div class="price">
                                        {if $service['addon']->isFree()}
                                            {lang key='orderfree'}
                                        {else}
                                            {$service['addonPrice']->price()}{($service['addon']->isOneTime()) ? '' : "/{$service['addonPrice']->getShortCycle()}"}
                                        {/if}
                                    </div>
                                {else}
                                    <div class="unavailable">{lang key='store.addon.wptk.unavailable'}</div>
                                {/if}
                            </div>
                            {if $service['addon']}
                                <button class="btn btn-warning btn-add-to-cart"
                                        data-product-name="{$service['addon']->name}"
                                        data-serviceid="{$service['service']->id}"
                                        data-addonid="{$service['addon']->id}"
                                        data-domain-name="{$service['service']->domain}"
                                        data-price="{$service['addonPrice']->price()->toNumeric()}">
                                    {lang key='addtocart'}
                                </button>
                            {else}
                                <button class="btn btn-warning btn-add-to-cart disabled">
                                    {lang key='addtocart'}
                                </button>
                            {/if}
                            <div class="in-cart-indicator">
                                <img src="{$WEB_ROOT}/assets/img/store/wp-toolkit/in-cart.png" alt="{lang key='domainchecker.alreadyincarttitle'}">
                            </div>
                        </div>
                    {/foreach}
                </div>
                <div class="cart">
                    <form method="post" data-role="cart-form" action="{fqdnRoutePath('store-add-addons')}">
                        <input type="hidden" name="servicemap">
                        <div class="cart-items">
                            <div class="item template">
                                <div class="product-info">
                                    <span class="product-name"></span>
                                    {lang key='store.addon.wptk.for'}
                                    <span class="domain-name"></span>
                                </div>
                                {$activeCurrency->prefix}<span class="price"></span>
                                <button class="btn btn-remove pull-right">
                                    <i class="fas fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-totals">
                            {lang key='store.addon.wptk.totalInCart'}
                            {$activeCurrency->prefix}<span class="cart-total-amount"></span>
                            <button type="submit" class="btn btn-success btn-checkout pull-right">
                                {lang key='store.addon.wptk.proceedToCheckout'}
                            </button>
                        </div>
                    </form>
                </div>
            {else}
                {if $firstMatchingAddon && !$firstMatchingAddon->pricing()->first()->isFree()}
                <div class="starting-from">{lang key='startingfrom'} {$firstMatchingAddon->pricing()->first()->price()}/{$firstMatchingAddon->pricing()->first()->getShortCycle()}</div>
                {/if}
                {if !$loggedin}
                <div class="subtitle">{lang key='store.addon.wptk.loginToSeePricing'}</div>
                {/if}
                <div class="action-btns">
                    <form method="post" action="{$browsePackagesAction}">
                        {if !$loggedin}
                            <a href="{routePath('store-addon-login', $addonSlug, $serviceId)}" class="btn btn-success">
                                {lang key='store.addon.wptk.loginNow'}
                            </a>
                        {/if}
                        <button type="submit" class="btn btn-warning">
                            {lang key='store.addon.wptk.browsePackages'}
                        </button>
                    </form>
                </div>
            {/if}
        </div>
    </div>

    <div class="faqs">
        <div class="container">
            <div class="row justify-content-around">
                <div class="col-lg-5">
                    <div class="border-line"></div>
                    <div class="faq-title">{lang key='store.addon.wptk.faqQ1'}</div>
                    <div class="faq-answer">{lang key='store.addon.wptk.faqA1'}</div>
                    <div class="border-line"></div>
                    <div class="faq-title">{lang key='store.addon.wptk.faqQ2'}</div>
                    <div class="faq-answer">{lang key='store.addon.wptk.faqA2'}</div>
                    <div class="border-line"></div>
                    <div class="faq-title">{lang key='store.addon.wptk.faqQ3'}</div>
                    <div class="faq-answer">{lang key='store.addon.wptk.faqA3'}</div>
                </div>
                <div class="col-lg-5">
                    <div class="border-line"></div>
                    <div class="faq-title">{lang key='store.addon.wptk.faqQ4'}</div>
                    <div class="faq-answer">{lang key='store.addon.wptk.faqA4' webRoot=$WEB_ROOT}</div>
                    <div class="border-line"></div>
                    <div class="faq-title">{lang key='store.addon.wptk.faqQ5'}</div>
                    <div class="faq-answer">{lang key='store.addon.wptk.faqA5' webRoot=$WEB_ROOT}</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        var cartTotal = 0;

        var ssoServiceId = {if $ssoService}{$ssoService->id}{else}0{/if};

        var changeServiceMap = function(callback)
        {
            var field = $('form[data-role="cart-form"]').find('input[name="servicemap"]');

            var value = $(field).val();

            try {
                value = JSON.parse(value);
            } catch (e) {
                value = {};
            }

            $(field).val(
                JSON.stringify(
                    callback(value)
                )
            );
        };

        $('.wp-toolkit .service-selector .btn-add-to-cart').click(function(e) {
            e.preventDefault();
            if ($(this).hasClass('disabled')) {
                return;
            }

            var serviceId = $(this).data('serviceid'),
                addonId = $(this).data('addonid');

            var row = $('.wp-toolkit .cart-items .item.template').clone()
                .removeClass('template')
                .find('.product-name').text($(this).data('product-name')).end()
                .find('.domain-name').text($(this).data('domain-name')).end()
                .find('.price').text($(this).data('price')).end()
                .attr('data-serviceid', $(this).data('serviceid'))
                .attr('data-price', $(this).data('price'));

            changeServiceMap(function(serviceMap) {
                serviceMap[serviceId] = addonId;
                return serviceMap;
            });

            $('.wp-toolkit .cart-items').append(row);
            $('.wp-toolkit .cart').slideDown();

            cartTotal += parseFloat($(this).data('price'));
            $('.wp-toolkit .cart-total-amount').text(cartTotal.toFixed(2));

            $(this).closest('.service').addClass('in-cart');
        });

        $(document).on('click', '.wp-toolkit .cart-items .btn-remove', function (e) {
            e.preventDefault();

            var $removeItem = $(this).closest('.item');
            var serviceId = $removeItem.data('serviceid');

            cartTotal -= $removeItem.data('price');
            $('.wp-toolkit .cart-total-amount').text(cartTotal.toFixed(2));

            $('.serviceid-' + serviceId).removeClass('in-cart');

            changeServiceMap(function(serviceMap) {
                if (serviceMap.hasOwnProperty(serviceId)) {
                    delete serviceMap[serviceId];
                }

                return serviceMap;
            });

            if ($('.wp-toolkit .cart-items .item:not(.template)').length <= 1) {
                $('.wp-toolkit .cart').slideUp('', function() {
                    $removeItem.remove();
                });
            } else {
                $removeItem.slideUp('', function() {
                    $(this).remove();
                });
            }
        });

        // pre-add the service we used to SSO from
        if (ssoServiceId) {
            $('.btn-add-to-cart[data-serviceid="' + ssoServiceId + '"]').click();
        }
    });
</script>
