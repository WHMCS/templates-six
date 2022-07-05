<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.landingPage.title"}</h2>
            <h3>{lang key="store.ssl.landingPage.tagline1"}<br>{lang key="store.ssl.landingPage.tagline2"}</h3>

        </div>
    </div>

    <div class="validation-levels">
        <div class="container">
            <h3>{lang key="store.ssl.landingPage.chooseLevel"}</h3>
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <div class="item">
                        <h4>{lang key="store.ssl.landingPage.dv"}</h4>
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-dv-icon.png">
                        <span>{lang key="store.ssl.landingPage.dvSubtitle"}</span>
                        <p>{lang key="store.ssl.landingPage.dvInformation"}</p>
                        <a href="{routePath('store-product-group', $routePathSlug, 'dv')}" class="btn">{lang key="store.ssl.landingPage.buy"}</a>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="item">
                        <h4>{lang key="store.ssl.landingPage.ov"}</h4>
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-ov-icon.png">
                        <span>{lang key="store.ssl.landingPage.ovSubtitle"}</span>
                        <p>{lang key="store.ssl.landingPage.ovInformation"}</p>
                        <a href="{routePath('store-product-group', $routePathSlug, 'ov')}" class="btn">{lang key="store.ssl.landingPage.buy"}</a>
                    </div>
                </div>
                <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-0">
                    <div class="item">
                        <h4>{lang key="store.ssl.landingPage.ev"}</h4>
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-ev-icon.png">
                        <span>{lang key="store.ssl.landingPage.evSubtitle"}</span>
                        <p>{lang key="store.ssl.landingPage.evInformation"}</p>
                        <a href="{routePath('store-product-group', $routePathSlug, 'ev')}" class="btn">{lang key="store.ssl.landingPage.buy"}</a>
                    </div>
                </div>
            </div>
            <p class="help-me-choose">
                <a href="#"><i class="fas fa-arrow-down"></i> {lang key="store.ssl.shared.helpMeChoose"}</a>
            </p>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current=""}

    <div class="content-block what-is-ssl standout">
        <div class="container">

            <div class="row">
                <div class="col-sm-4 col-md-3 col-sm-push-8 col-md-push-9 text-right hidden-xs">
                    <br><br>
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-multi.png">
                </div>
                <div class="col-sm-8 col-md-9 col-sm-pull-4 col-md-pull-3">

                    <h2>{lang key="store.ssl.landingPage.what"}</h2>

                    <div class="text-center visible-xs">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-multi.png">
                        <br><br>
                    </div>

                    <p>{lang key="store.ssl.landingPage.whatInfo"}</p>

                    <ul>
                        <li>
                            <i class="fas fa-check-circle"></i>
                            {lang key="store.ssl.landingPage.secureConnection"}
                        </li>
                        <li>
                            <i class="fas fa-check-circle"></i>
                            {lang key="store.ssl.landingPage.encrypts"}
                        </li>
                        <li>
                            <i class="fas fa-check-circle"></i>
                            {lang key="store.ssl.landingPage.padlock"}
                        </li>
                        <li>
                            <i class="fas fa-check-circle"></i>
                            {lang key="store.ssl.landingPage.authenticates"}
                        </li>
                    </ul>

                    <p>{lang key="store.ssl.landingPage.certTypeInfo" dvLink=routePath('store-product-group', $routePathSlug, 'dv') ovLink=routePath('store-product-group', $routePathSlug, 'ov') evLink=routePath('store-product-group', $routePathSlug, 'ev')}</p>

                </div>
            </div>

        </div>
    </div>

    <div class="content-block ssl-benefits standout">
        <div class="container">

            <h2>{lang key="store.ssl.landingPage.benefits.title"}</h2>

            <h4>{lang key="store.ssl.landingPage.benefits.subtitle"}</h4>

            <p>{lang key="store.ssl.landingPage.benefits.higherResults"}</p>

            <p>{lang key="store.ssl.landingPage.benefits.reasons"}:</p>

            <div class="row">
                <div class="col-md-2 col-sm-4">
                    <i class="fas fa-globe"></i>
                    {lang key="store.ssl.landingPage.benefits.encrypt"}
                </div>
                <div class="col-md-2 col-sm-4">
                    <i class="fas fa-user"></i>
                    {lang key="store.ssl.landingPage.benefits.privacy"}
                </div>
                <div class="col-md-2 col-sm-4">
                    <i class="fas fa-credit-card"></i>
                    {lang key="store.ssl.landingPage.benefits.secure"}
                </div>
                <div class="col-md-2 col-sm-4">
                    <i class="fas fa-lock"></i>
                    {lang key="store.ssl.landingPage.benefits.https"}
                </div>
                <div class="col-md-2 col-sm-4">
                    <i class="fas fa-trophy"></i>
                    {lang key="store.ssl.landingPage.benefits.legitimacy"}
                </div>
                <div class="col-md-2 col-sm-4">
                    <i class="fas fa-search"></i>
                    {lang key="store.ssl.landingPage.benefits.seo"}
                </div>
            </div>

        </div>
    </div>

    <div class="standout-1">
        <div class="container browser">
            <h3>{lang key="store.ssl.landingPage.browser.title"}</h3>
            <div class="browser-image">
                <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/browser-warning.jpg">
            </div>
        </div>
        <div class="browser-notice">
            <div class="wrapper-container">
                <div class="wrapper">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/padlock-x.png">
                    {lang key="store.ssl.landingPage.browser.insecureNotice"}
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="content-block competitive-upgrade-promo">
        <div class="container">
            {lang key="store.ssl.landingPage.secureInMinutes"}
        </div>
    </div>

    <div class="content-block standout">
        <div class="container">
            <h2>{lang key="store.ssl.landingPage.evs.upgradeTitle"}</h2>
            <p>{lang key="store.ssl.landingPage.evs.description"}</p>
            <p>{lang key="store.ssl.landingPage.evs.whatIs"}</p>
            <br>
            <div class="row text-center">
                <div class="col-sm-6 col-md-4">
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/shopfront-dv.png">
                        <h4>{lang key="store.ssl.landingPage.dv"}</h4>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4">
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/shopfront-ov.png">
                        <h4>{lang key="store.ssl.landingPage.ov"}</h4>
                    </div>
                </div>
                <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-0">
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/shopfront-ev.png">
                        <h4>{lang key="store.ssl.landingPage.ev"}</h4>
                    </div>
                </div>
            </div>
            <br>
            <p class="text-center"><a href="{routePath('store-product-group', $routePathSlug, 'ev')}" class="btn btn-default">{lang key="store.ssl.landingPage.evs.learn"}</a></p>
        </div>
    </div>

    <div class="content-block detailed-info" id="sslDetail">
        <div class="container">

            <div class="panel">
                <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#collapseHelpMeChoose" class="panel-title expand">
                   <span class="arrow"><i class="fas fa-chevron-down"></i></span>
                  <a href="#">{lang key="store.ssl.landingPage.help.title"}</a>
                </h4>
              </div>
              <div id="collapseHelpMeChoose" class="panel-collapse collapse in">
                <div class="panel-body">

                    <p>{lang key="store.ssl.landingPage.help.guide"}</p>

                    <div class="row help-me-choose">
                        <div class="col-sm-4">
                            <h4>{lang key="store.ssl.landingPage.help.dv.title"}</h4>

                            <ul>
                                <li>{lang key="store.ssl.landingPage.help.dv.verify"}</li>
                                <li>{lang key="store.ssl.landingPage.help.dv.issued"}</li>
                                <li>{lang key="store.ssl.landingPage.help.dv.compliance"}</li>
                            </ul>

                            <p class="ideal">{lang key="store.ssl.landingPage.help.dv.for"}</p>

                            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/card-library.png" class="img-responsive">

                            <p class="ssl-types-expl">{lang key="store.ssl.landingPage.help.dv.type"}</p>

                            <a href="{routePath('store-product-group', $routePathSlug, 'dv')}" class="btn btn-primary btn-block">{lang key="store.ssl.landingPage.help.dv.browse"}</a>
                        </div>
                        <div class="col-sm-4">
                            <h4>{lang key="store.ssl.landingPage.help.ov.title"}</h4>

                            <ul>
                                <li>{lang key="store.ssl.landingPage.help.ov.verify"}</li>
                                <li>{lang key="store.ssl.landingPage.help.ov.issued"}</li>
                                <li>{lang key="store.ssl.landingPage.help.ov.compliance"}</li>
                            </ul>

                            <p class="ideal">{lang key="store.ssl.landingPage.help.ov.for"}</p>

                            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/card-driving.png" class="img-responsive">

                            <p class="ssl-types-expl">{lang key="store.ssl.landingPage.help.ov.type"}</p>

                            <a href="{routePath('store-product-group', $routePathSlug, 'ov')}" class="btn btn-primary btn-block">{lang key="store.ssl.landingPage.help.ov.browse"}</a>
                        </div>
                        <div class="col-sm-4">
                            <h4>{lang key="store.ssl.landingPage.help.ev.title"}</h4>

                            <ul>
                                <li>{lang key="store.ssl.landingPage.help.ev.verify"}</li>
                                <li>{lang key="store.ssl.landingPage.help.ev.issued"}</li>
                                <li>{lang key="store.ssl.landingPage.help.ev.compliance"}</li>
                            </ul>

                            <p class="ideal">{lang key="store.ssl.landingPage.help.ev.for"}</p>

                            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/card-passport.png" class="img-responsive">

                            <p class="ssl-types-expl">{lang key="store.ssl.landingPage.help.ev.type"}</p>

                            <a href="{routePath('store-product-group', $routePathSlug, 'ev')}" class="btn btn-primary btn-block">{lang key="store.ssl.landingPage.help.ev.browse"}</a>
                        </div>
                    </div>

                </div>
              </div>
            </div>
            <div class="panel">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#collapseAllCerts" class="panel-title expand">
                   <span class="arrow"><i class="fas fa-chevron-right"></i></span>
                  <a href="#">{lang key="store.ssl.landingPage.viewAll"}</a>
                </h4>
              </div>
              <div id="collapseAllCerts" class="panel-collapse collapse">
                <div class="panel-body">

                    {include file="$template/store/ssl/shared/currency-chooser.tpl"}

                    <ul class="ssl-certs-all">
                        {if count($certificates) > 0}
                            {foreach $certificates as $type => $products}
                                {foreach $products as $product}
                                    <li>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <h4>{$product->name}</h4>
                                                <p>{$product->description}</p>
                                            </div>
                                            <div class="col-sm-3 col-sm-offset-1">
                                                <div class="padded-cell price">
                                                    {lang key='from'}<br>
                                                    <strong>{$product->pricing()->best()->yearlyPrice()}</strong>
                                                </div>
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="padded-cell">
                                                    <form method="post" action="{routePath('cart-order')}">
                                                        <input type="hidden" name="pid" value="{$product->id}">
                                                        <button type="submit" class="btn btn-success btn-block">{lang key="store.ssl.landingPage.buyNow"}</button>
                                                    </form>
                                                    <a href="{routePath("store-product-group", $routePathSlug, $type)}">{lang key="learnmore"}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                {/foreach}
                            {/foreach}
                        {elseif $inPreview}
                            <div class="lead text-center">
                                {lang key="store.ssl.shared.noProducts"}
                            </div>
                        {/if}
                    </ul>

                </div>
              </div>
            </div>

            <div class="panel">
                <div class="panel-heading">
                    <h4 class="panel-title expand" data-toggle="collapse" data-parent="#accordion" data-target="#collapseMultiYear">
                        <span class="arrow"><i class="fas fa-chevron-down"></i></span>
                        {lang key='store.ssl.landingPage.multiYear.title'}
                    </h4>
                </div>
                <div id="collapseMultiYear" class="panel-collapse collapse">
                    <div class="panel-body">
                        <p>{lang key='store.ssl.landingPage.multiYear.p1'}</p>
                        <p>{lang key='store.ssl.landingPage.multiYear.p2'}</p>
                        <p>{lang key='store.ssl.landingPage.multiYear.p3'}</p>
                        <p>
                            {lang key='store.ssl.landingPage.multiYear.p4'}
                            <div class="text-center margin-10">
                                <img alt="SSL certificate lifecycle" src="{$WEB_ROOT}/assets/img/marketconnect/symantec/multi-year-flow.png">
                            </div>
                        </p>
                        <p>{lang key='store.ssl.landingPage.multiYear.p5'}</p>
                        <h3>{lang key='store.ssl.landingPage.multiYear.benefits.title'}</h3>
                        <ul>
                            <li>{lang key='store.ssl.landingPage.multiYear.benefits.b1'}</li>
                            <li>{lang key='store.ssl.landingPage.multiYear.benefits.b2'}</li>
                            <li>{lang key='store.ssl.landingPage.multiYear.benefits.b3'}</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="panel">
              <div class="panel-heading">
                <h4 data-toggle="collapse" data-parent="#accordion" href="#collapseFaq" class="panel-title expand">
                    <span class="arrow"><i class="fas fa-chevron-right"></i></span>
                  <a href="#">{lang key="store.ssl.landingPage.faq.title"}</a>
                </h4>
              </div>
              <div id="collapseFaq" class="panel-collapse collapse">
                <div class="panel-body">

                    <h4>{lang key="store.ssl.landingPage.faq.q1"}</h4>

                    <p>{lang key="store.ssl.landingPage.faq.a1"}</p>

                    <h4>{lang key="store.ssl.landingPage.faq.q2"}</h4>

                    <p>{lang key="store.ssl.landingPage.faq.a2"}</p>

                    <h4>{lang key="store.ssl.landingPage.faq.q3"}</h4>

                    <p>{lang key="store.ssl.landingPage.faq.a3"}</p>

                    {if count($certificates.wildcard) > 0 || $inPreview}

                        <h4>{lang key="store.ssl.landingPage.faq.q4"}</h4>

                        <p>{lang key="store.ssl.landingPage.faq.a4"} <a href="{routePath('store-product-group', $routePathSlug, 'wildcard')}">{lang key="learnmore"}</a></p>

                    {/if}

                    {if count($certificates.ev) > 0 || $inPreview}

                        <h4>{lang key="store.ssl.landingPage.faq.q5"}</h4>

                        <p>{lang key="store.ssl.landingPage.faq.a5"}</p>

                    {/if}
                </div>
              </div>
            </div>

        </div>
    </div>

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>

<script>
jQuery(document).ready(function() {
  jQuery(".expand").on( "click", function() {
    var expand = jQuery(this).find(">:first-child i");
    if(expand.hasClass('fa-chevron-right')) {
        expand.removeClass('fa-chevron-right').addClass('fa-chevron-down');
    } else {
        expand.removeClass('fa-chevron-down').addClass('fa-chevron-right');
    }
  });
  jQuery('p.help-me-choose').click(function(e) {
    e.preventDefault();
    if (!jQuery('#collapseHelpMeChoose').hasClass('in')) {
      jQuery('#collapseHelpMeChoose').collapse('show');
    }
    jQuery('html, body').animate({
      scrollTop: jQuery('#collapseHelpMeChoose').offset().top - 75
    }, 500);
  });
  var hash = location.hash.replace('#', '');
  if (hash == 'helpmechoose') {
    jQuery('html, body').animate({
      scrollTop: jQuery('#collapseHelpMeChoose').offset().top - 75
    }, 500);
  }
});
</script>
