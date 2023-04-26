<link href="{assetPath file='store.css'}?v={$versionHash}" rel="stylesheet">
<div class="landing-page bg-white threesixtymonitoring">
    <section class="section-header" style="background-image: url('{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/section-header-bg.png')">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-6">
                    <img class="img-logo" src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/logo.png">
                    <img class="d-lg-none img-full" src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/header-screens.png">
                    {if $websitePlanCount > 0}
                    <div class="tab-website">
                        <h1>{lang key="store.threesixtymonitoring.websiteHeading.title"}</h1>
                        <p class="p-tagline">{lang key="store.threesixtymonitoring.websiteHeading.tagline"}</p>
                        <form action="{routePath('cart-threesixtymonitoring-site-check')}" id="frmSiteCheck">
                            <div class="form-row">
                                <div class="col-xs-12 col-sm-5">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="url" placeholder="www.example.com">
                                    </div>
                                </div>
                                <div class="col-xs-10 col-sm-5">
                                    <div class="form-group">
                                        <select class="form-control" name="probe_id">
                                            <option value="">Select location</option>
                                            {foreach $threesixtymonitoring.probes as $probe}
                                                <option value="{$probe.id}">{$probe.name}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-2">
                                    <button type="submit" class="btn btn-search">
                                        <i class="far fa-search main-icon"></i>
                                        <i class="fas fa-spinner fa-spin" style="display: none"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    {/if}
                    {if $serverPlanCount > 0}
                    <div class="tab-server"{if $websitePlanCount > 0} style="display: none;"{/if}>
                        <p class="p-tagline">{lang key="store.threesixtymonitoring.serverHeading.tagline"}</p>
                        <h1>{lang key="store.threesixtymonitoring.serverHeading.title"}</h1>
                        <a href="#serverSectionPricing" class="btn btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.getStarted"}</a>
                    </div>
                    {/if}
                </div>
                <div class="col-xs-6 d-none d-lg-block">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/header-screens.png">
                </div>
            </div>
        </div>
    </section>

    <nav class="nav-primary text-center">
        <div class="container">
            <ul class="nav nav-tabs" id="pills-tab" role="tablist">
                {if $websitePlanCount > 0}
                <li class="nav-item{if $websitePlanCount > 0} active{/if}{if $websitePlanCount > 0 && $serverPlanCount <= 0} nav-full-width{/if}" role="presentation">
                    <a class="nav-link" id="pills-website-tab" data-toggle="tab" href="#pills-website" role="tab" aria-controls="pills-website" aria-selected="true">
                        {lang key="store.threesixtymonitoring.navTab.website"}
                    </a>
                </li>
                {/if}
                {if $serverPlanCount > 0}
                <li class="nav-item{if $websitePlanCount <= 0} active{/if}{if $serverPlanCount > 0 && $websitePlanCount <= 0} nav-full-width{/if}" role="presentation">
                    <a class="nav-link" id="pills-server-tab" data-toggle="tab" href="#pills-server" role="tab" aria-controls="pills-server" aria-selected="false">
                        {lang key="store.threesixtymonitoring.navTab.server"}
                    </a>
                </li>
                {/if}
            </ul>
        </div>
    </nav>

    <div class="tab-content">
        <div class="tab-pane tab-website fade{if $websitePlanCount > 0} in active{/if}" id="pills-website" role="tabpanel" aria-labelledby="pills-website-tab">
            <section class="section-discover">
                <div class="container">
                    <div class="div-heading-container">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/screen-full-site.png">
                        <div class="div-heading-text">
                            <h2>{lang key="store.threesixtymonitoring.websiteDiscover.title"}</h2>
                            <p class="p-tagline">{lang key="store.threesixtymonitoring.websiteDiscover.tagline"}</p>
                        </div>
                    </div>
                    <div class="row row-features">
                        <div class="col-xs-6 col-sm-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0008_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteDiscover.i1" tagOpen="<strong>" tagClose="</strong>"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0007_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteDiscover.i2" tagOpen="<strong>" tagClose="</strong>"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-sm-4 col-xs-offset-3 col-sm-offset-0">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0006_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteDiscover.i3" tagOpen="<strong>" tagClose="</strong>"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="#websiteSectionPricing" class="btn btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.startMonitoringLong"}</a>
                </div>
            </section>

            <section class="section-features">
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.websiteFeatures.title"}</h2>
                    <nav class="nav-secondary">
                        <ul class="nav nav-tabs" id="how-tab" role="tablist">
                            <li class="nav-item active" role="presentation">
                                <a class="nav-link" id="features-website-tab" data-toggle="pill" href="#features-website" role="tab" aria-controls="features-website" aria-selected="true">
                                    {lang key="store.threesixtymonitoring.navTab.website"}
                                </a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="features-server-tab" data-toggle="pill" href="#features-server" role="tab" aria-controls="features-server" aria-selected="false">
                                    {lang key="store.threesixtymonitoring.navTab.full"}
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="features-website" role="tabpanel" aria-labelledby="features-website-tab">
                            <div class="row row-features">
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0005_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i1a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i1b"}</p>
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i1c"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0004_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i2a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i2b"}</p>
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i2c"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0003_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i3a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i3b"}</p>
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i3c"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0002_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i4a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i4b"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0001_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i5a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i5b"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0000_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i6a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i6b"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="#websiteSectionPricing" class="btn btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.getStarted"}</a>
                        </div>
                        <div class="tab-pane fade" id="features-server" role="tabpanel" aria-labelledby="features-server-tab">
                            <div class="row row-features">
                                <div class="col-xs-12 col-sm-6">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0012_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i7a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i7b"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0011_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i8a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i8b"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0010_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i9a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i9b"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0009_icon.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <span>{lang key="store.threesixtymonitoring.websiteFeatures.i10a"}</span>
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.websiteFeatures.i10b"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="#websiteSectionPricing" class="btn btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.getStarted"}</a>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section-notifications">
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.notifications.title"}</h2>
                    <p class="p-tagline">{lang key="store.threesixtymonitoring.notifications.tagline"}</p>
                    <div class="row row-notifications">
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0012_mail.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.email"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0011_sms.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.sms"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0008_push.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.pushbullet"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0009_gch.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.googlechat"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0010_pb.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.pushover"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0013_discord.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.discord"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0007_slack.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.slack"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0006_webhook.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.webhook"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3 col-md-offset-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0005_stride.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.stride"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0004_pager.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.pagerduty"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0003_tg.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.telegram"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3 d-lg-none">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0002_flock.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.flock"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3 d-none d-lg-block">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0002_flock.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.flock"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-xs-offset-3 col-md-offset-0">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0001_ms.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.microsoft365"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0000_genie.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.opsgenie"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section-monitoring" style="background-image: url('{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/section-monitoring-bg.png')">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                            <h2>{lang key="store.threesixtymonitoring.websiteMonitor.title"}</h2>
                            <img class="d-block d-lg-none img-full" src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/screen-status.png">
                            <p class="p-tagline">{lang key="store.threesixtymonitoring.websiteMonitor.tagline"}</p>
                            <a href="#websiteSectionPricing" class="btn btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.startMonitoringShort"}</a>
                        </div>
                        <div class="col-xs-6 d-none d-lg-block">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/screen-status.png">
                        </div>
                    </div>
                </div>
            </section>

            <section id="websiteSectionPricing" class="section-pricing">
                {if $websitePlanCount > 0}
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.websitePricing.title"}</h2>
                    <div class="div-pricing-container clearfix">
                        {foreach $planComparisonData['website'] as $plan}
                            <div class="div-feature-labels feature-count-{$websitePlanCount}">
                                <div class="header"></div>
                                <ul>
                                    {foreach $plan->features as $featureKey => $featureValue}
                                        {if $featureKey != 'tagLine'}
                                            <li>{lang key="store.threesixtymonitoring.comparison."|cat:$featureKey}</li>
                                        {/if}
                                    {/foreach}
                                </ul>
                                <div class="div-feature-label-starting">{lang key="store.threesixtymonitoring.comparison.startingFrom"}</div>
                            </div>
                            <div class="div-feature-values feature-count-{$websitePlanCount}">
                                <div class="header">
                                    <div class="row">
                                        <div class="col-xs-12 div-plan-name">
                                            {$plan->name}
                                            <div class="div-heading-border"></div>
                                        </div>
                                        <div class="col-xs-12 div-plan-tagline">
                                            {lang key="store.threesixtymonitoring.comparison."|cat:$plan->features['tagLine']}
                                        </div>
                                    </div>
                                </div>
                                <ul>
                                    {foreach $plan->features as $featureKey => $featureValue}
                                        {if $featureKey != 'tagLine'}
                                            <li>
                                                {if !$featureValue}
                                                    <i class="fal fa-times"></i>
                                                {elseif $featureKey == 'timeIntervals'}
                                                    {if $featureValue == 1}
                                                        60 {lang key="seconds"}
                                                    {else}
                                                        {$featureValue} {lang key="minutes"}
                                                    {/if}
                                                {elseif $featureKey == 'dataRetention'}
                                                    {if $featureValue == 1}
                                                        24 {lang key="hours"}
                                                    {else}
                                                        {$featureValue} {lang key="days"}
                                                    {/if}
                                                {elseif $featureValue == 'yes'}
                                                    {lang key="yes"}
                                                {elseif is_string($featureValue)}
                                                    {lang key="store.threesixtymonitoring.comparison."|cat:$featureValue tagOpen="<strong>" tagClose="</strong>"}
                                                {else}
                                                    {$featureValue}
                                                {/if}
                                            </li>
                                        {/if}
                                    {/foreach}
                                </ul>
                                <div class="div-feature-price">
                                    {if $inPreview && !$featurePrice}
                                        <div class="div-sample-price">$1.23</div>
                                    {elseif $plan->isFree()}
                                        {lang key="orderpaymenttermfree"}
                                    {else}
                                        {$plan->pricing()->first()->toPrefixedString()}
                                    {/if}
                                </div>
                                <div class="div-feature-order">
                                    <form method="post" action="{routePath('cart-order')}">
                                        <input type="hidden" name="checkout" value="1">
                                        <input type="hidden" name="pid" value="{$plan->id}">
                                        <button class="btn btn-primary" type="submit"{if $inPreview} disabled="disabled"{/if}>
                                            {lang key="ordertitle"}
                                        </button>
                                    </form>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    {if $serverPlanCount > 0}<p class="p-pricing-cta">{lang key="store.threesixtymonitoring.websitePricing.cta" tagOpen="<strong>" tagClose="</strong>"} <a href="#serverSectionPricing">{lang key="clickHere"}</a>{/if}
                </div>
                {/if}
            </section>

            <section class="section-faq">
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.faq.title"}</h2>
                    <div class="panel-group" id="websiteFaqAccordion" role="tablist" aria-multiselectable="true">
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingOne">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqOne" aria-expanded="false" aria-controls="websiteFaqOne">
                                        {lang key="store.threesixtymonitoring.faq.q1"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqOne" aria-expanded="false" aria-controls="websiteFaqOne"></i>
                            </div>
                            <div id="websiteFaqOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingOne" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a1"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingThree">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqThree" aria-expanded="false" aria-controls="websiteFaqThree">
                                        {lang key="store.threesixtymonitoring.faq.q3"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqThree" aria-expanded="false" aria-controls="websiteFaqThree"></i>
                            </div>
                            <div id="websiteFaqThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingThree" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a3"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingFive">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqFive" aria-expanded="false" aria-controls="websiteFaqFive">
                                        {lang key="store.threesixtymonitoring.faq.q5"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqFive" aria-expanded="false" aria-controls="websiteFaqFive"></i>
                            </div>
                            <div id="websiteFaqFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingFive" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a5"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingSeven">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqSeven" aria-expanded="false" aria-controls="websiteFaqSeven">
                                        {lang key="store.threesixtymonitoring.faq.q7"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqSeven" aria-expanded="false" aria-controls="websiteFaqSeven"></i>
                            </div>
                            <div id="websiteFaqSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingSeven" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a7"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingNine">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqNine" aria-expanded="false" aria-controls="websiteFaqNine">
                                        {lang key="store.threesixtymonitoring.faq.q9"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqNine" aria-expanded="false" aria-controls="websiteFaqNine"></i>
                            </div>
                            <div id="websiteFaqNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingNine" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a9"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingTwo">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqTwo" aria-expanded="false" aria-controls="websiteFaqTwo">
                                        {lang key="store.threesixtymonitoring.faq.q2"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqTwo" aria-expanded="false" aria-controls="websiteFaqTwo"></i>
                            </div>
                            <div id="websiteFaqTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingTwo" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a2"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingFour">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqFour" aria-expanded="false" aria-controls="websiteFaqFour">
                                        {lang key="store.threesixtymonitoring.faq.q4"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqFour" aria-expanded="false" aria-controls="websiteFaqFour"></i>
                            </div>
                            <div id="websiteFaqFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingFour" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a4"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingSix">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqSix" aria-expanded="false" aria-controls="websiteFaqSix">
                                        {lang key="store.threesixtymonitoring.faq.q6"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqSix" aria-expanded="false" aria-controls="websiteFaqSix"></i>
                            </div>
                            <div id="websiteFaqSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingSix" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a6"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="websiteFaqHeadingEight">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#websiteFaqEight" aria-expanded="false" aria-controls="websiteFaqEight">
                                        {lang key="store.threesixtymonitoring.faq.q8"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#websiteFaqEight" aria-expanded="false" aria-controls="websiteFaqEight"></i>
                            </div>
                            <div id="websiteFaqEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="websiteFaqHeadingEight" data-parent="#websiteFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a8"}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <div class="tab-pane tab-server fade{if $websitePlanCount <= 0} in active{/if}" id="pills-server" role="tabpanel" aria-labelledby="pills-server-tab">
            <section class="section-discover">
                <div class="container">
                    <div class="div-heading-container">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/screen-dash.png">
                        <div class="div-heading-text">
                            <h2>{lang key="store.threesixtymonitoring.websiteDiscover.title"}</h2>
                            <p class="p-tagline">{lang key="store.threesixtymonitoring.serverDiscover.tagline"}</p>
                        </div>
                    </div>
                    <div class="row row-features">
                        <div class="col-xs-6">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/server_0001_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.serverDiscover.i1" tagOpen="<strong>" tagClose="</strong>"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/server_0000_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.serverDiscover.i2" tagOpen="<strong>" tagClose="</strong>"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="section-monitoring">
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.serverMonitor.title"}</h2>
                    <p class="p-tagline">{lang key="store.threesixtymonitoring.serverMonitor.tagline"}</p>
                    <h3>{lang key="store.threesixtymonitoring.serverMonitor.lostRevenue"}</h3>
                    <div class="row row-revenue">
                        <div class="col-xs-6 col-md-3">
                            <div class="row">
                                <div class="col-xs-12">99.9%</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.uptime"}</div>
                                <div class="col-xs-12">=</div>
                                <div class="col-xs-12">$500</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-3">
                            <div class="row">
                                <div class="col-xs-12">99.8%</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.uptime"}</div>
                                <div class="col-xs-12">=</div>
                                <div class="col-xs-12">$1000</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-3">
                            <div class="row">
                                <div class="col-xs-12">99.7%</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.uptime"}</div>
                                <div class="col-xs-12">=</div>
                                <div class="col-xs-12">$1,500</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</div>
                            </div>
                        </div>
                        <div class="col-xs-6 col-md-3">
                            <div class="row">
                                <div class="col-xs-12">98%</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.uptime"}</div>
                                <div class="col-xs-12">=</div>
                                <div class="col-xs-12">$10,000</div>
                                <div class="col-xs-12">{lang key="store.threesixtymonitoring.serverMonitor.perYear"}</div>
                            </div>
                        </div>
                    </div>
                    <p>{lang key="store.threesixtymonitoring.serverMonitor.asterisk"}</p>
                    <a href="#serverSectionPricing" class="btn btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.startMonitoringShort"}</a>
                </div>
            </section>

            <section class="section-features">
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.websiteFeatures.title"}</h2>
                    <div class="row row-features">
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0005_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i1a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i1b"}</p>
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i1c"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0004_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i2a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i2b"}</p>
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i2c"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0003_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i3a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i3b"}</p>
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i3c"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0002_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i4a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i4b"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0001_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i5a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i5b"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/website_0000_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i6a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i6b"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/server_0002_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i7a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i7b"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/server_0003_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i8a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i8b"}</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-0">
                            <div class="row">
                                <div class="col-xs-12">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/server_0004_icon.png">
                                </div>
                                <div class="col-xs-12">
                                    <span>{lang key="store.threesixtymonitoring.websiteFeatures.i9a"}</span>
                                </div>
                                <div class="col-xs-12">
                                    <p>{lang key="store.threesixtymonitoring.websiteFeatures.i9b"}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="#serverSectionPricing" class="btn btn-primary btn-pricing-scroll">{lang key="store.threesixtymonitoring.button.getStarted"}</a>
                </div>
            </section>

            <section class="section-notifications">
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.notifications.title"}</h2>
                    <p class="p-tagline">{lang key="store.threesixtymonitoring.notifications.tagline"}</p>
                    <div class="row row-notifications">
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0012_mail.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.email"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0011_sms.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.sms"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0008_push.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.pushbullet"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0009_gch.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.googlechat"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0010_pb.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.pushover"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0013_discord.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.discord"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0007_slack.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.slack"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0006_webhook.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.webhook"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3 col-md-offset-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0005_stride.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.stride"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0004_pager.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.pagerduty"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0003_tg.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.telegram"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3 d-lg-none">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0002_flock.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.flock"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-6">
                            <div class="row">
                                <div class="col-xs-3 d-none d-lg-block">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0002_flock.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.flock"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-xs-offset-3 col-md-offset-0">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0001_ms.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.microsoft365"}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-3">
                                    <div class="row">
                                        <div class="col-xs-12 col-brand-img">
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/app_0000_genie.png">
                                        </div>
                                        <div class="col-xs-12">
                                            <p>{lang key="store.threesixtymonitoring.notifications.opsgenie"}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="serverSectionPricing" class="section-pricing">
                {if $serverPlanCount > 0}
                    <div class="container">
                        <h2>{lang key="store.threesixtymonitoring.websitePricing.title"}</h2>
                        <div class="div-pricing-container clearfix">
                            {foreach $planComparisonData['server'] as $plan}
                                <div class="div-feature-labels feature-count-{$serverPlanCount}">
                                    <div class="header"></div>
                                    <ul>
                                        {foreach $plan->features as $featureKey => $featureValue}
                                            {if $featureKey != 'tagLine'}
                                                <li>{lang key="store.threesixtymonitoring.comparison."|cat:$featureKey}</li>
                                            {/if}
                                        {/foreach}
                                    </ul>
                                    <div class="div-feature-label-starting">{lang key="store.threesixtymonitoring.comparison.startingFrom"}</div>
                                </div>
                                <div class="div-feature-values feature-count-{$serverPlanCount}">
                                    <div class="header">
                                        <div class="row">
                                            <div class="col-xs-12 div-plan-name">
                                                {$plan->name}
                                                <div class="div-heading-border"></div>
                                            </div>
                                            <div class="col-xs-12 div-plan-tagline">
                                                {lang key="store.threesixtymonitoring.comparison."|cat:$plan->features['tagLine']}
                                            </div>
                                        </div>
                                    </div>
                                    <ul>
                                        {foreach $plan->features as $featureKey => $featureValue}
                                            {if $featureKey != 'tagLine'}
                                                <li>
                                                    {if !$featureValue}
                                                        <i class="fal fa-times"></i>
                                                    {elseif $featureKey == 'timeIntervals'}
                                                        {if $featureValue == 1}
                                                            60 {lang key="seconds"}
                                                        {else}
                                                            {$featureValue} {lang key="minutes"}
                                                        {/if}
                                                    {elseif $featureKey == 'dataRetention'}
                                                        {if $featureValue == 1}
                                                            24 {lang key="hours"}
                                                        {else}
                                                            {$featureValue} {lang key="days"}
                                                        {/if}
                                                    {elseif $featureValue == 'yes'}
                                                        {lang key="yes"}
                                                    {elseif is_string($featureValue)}
                                                        {lang key="store.threesixtymonitoring.comparison."|cat:$featureValue tagOpen="<strong>" tagClose="</strong>"}
                                                    {else}
                                                        {$featureValue}
                                                    {/if}
                                                </li>
                                            {/if}
                                        {/foreach}
                                    </ul>
                                    <div class="div-feature-price">
                                        {if $inPreview && !$featurePrice}
                                            <div class="div-sample-price">$1.23</div>
                                        {elseif $plan->isFree()}
                                            {lang key="orderpaymenttermfree"}
                                        {else}
                                            {$plan->pricing()->first()->toPrefixedString()}
                                        {/if}
                                    </div>
                                    <div class="div-feature-order">
                                        <form method="post" action="{routePath('cart-order')}">
                                            <input type="hidden" name="checkout" value="1">
                                            <input type="hidden" name="pid" value="{$plan->id}">
                                            <button class="btn btn-primary" type="submit"{if $inPreview} disabled="disabled"{/if}>
                                                {lang key="ordertitle"}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                        {if $websitePlanCount > 0}<p class="p-pricing-cta">{lang key="store.threesixtymonitoring.serverPricing.cta" tagOpen="<strong>" tagClose="</strong>"} <a href="#websiteSectionPricing">{lang key="clickHere"}</a></p>{/if}
                    </div>
                {/if}
            </section>

            <section class="section-faq">
                <div class="container">
                    <h2>{lang key="store.threesixtymonitoring.faq.title"}</h2>
                    <div class="panel-group" id="serverFaqAccordion" role="tablist" aria-multiselectable="true">
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingOne">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqOne" aria-expanded="false" aria-controls="serverFaqOne">
                                        {lang key="store.threesixtymonitoring.faq.q1"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqOne" aria-expanded="false" aria-controls="serverFaqOne"></i>
                            </div>
                            <div id="serverFaqOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingOne" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a1"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingThree">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqThree" aria-expanded="false" aria-controls="serverFaqThree">
                                        {lang key="store.threesixtymonitoring.faq.q3"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqThree" aria-expanded="false" aria-controls="serverFaqThree"></i>
                            </div>
                            <div id="serverFaqThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingThree" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a3"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingFive">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqFive" aria-expanded="false" aria-controls="serverFaqFive">
                                        {lang key="store.threesixtymonitoring.faq.q5"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqFive" aria-expanded="false" aria-controls="serverFaqFive"></i>
                            </div>
                            <div id="serverFaqFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingFive" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a5"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingSeven">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqSeven" aria-expanded="false" aria-controls="serverFaqSeven">
                                        {lang key="store.threesixtymonitoring.faq.q7"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqSeven" aria-expanded="false" aria-controls="serverFaqSeven"></i>
                            </div>
                            <div id="serverFaqSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingSeven" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a7"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingNine">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqNine" aria-expanded="false" aria-controls="serverFaqNine">
                                        {lang key="store.threesixtymonitoring.faq.q9"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqNine" aria-expanded="false" aria-controls="serverFaqNine"></i>
                            </div>
                            <div id="serverFaqNine" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingNine" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a9"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingEleven">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqEleven" aria-expanded="false" aria-controls="serverFaqEleven">
                                        {lang key="store.threesixtymonitoring.faq.q11"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqEleven" aria-expanded="false" aria-controls="serverFaqEleven"></i>
                            </div>
                            <div id="serverFaqEleven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingEleven" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a11"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingTwo">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqTwo" aria-expanded="false" aria-controls="serverFaqTwo">
                                        {lang key="store.threesixtymonitoring.faq.q2"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqTwo" aria-expanded="false" aria-controls="serverFaqTwo"></i>
                            </div>
                            <div id="serverFaqTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingTwo" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a2"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingFour">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqFour" aria-expanded="false" aria-controls="serverFaqFour">
                                        {lang key="store.threesixtymonitoring.faq.q4"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqFour" aria-expanded="false" aria-controls="serverFaqFour"></i>
                            </div>
                            <div id="serverFaqFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingFour" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a4"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingSix">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqSix" aria-expanded="false" aria-controls="serverFaqSix">
                                        {lang key="store.threesixtymonitoring.faq.q6"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqSix" aria-expanded="false" aria-controls="serverFaqSix"></i>
                            </div>
                            <div id="serverFaqSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingSix" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a6"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingEight">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqEight" aria-expanded="false" aria-controls="serverFaqEight">
                                        {lang key="store.threesixtymonitoring.faq.q8"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqEight" aria-expanded="false" aria-controls="serverFaqEight"></i>
                            </div>
                            <div id="serverFaqEight" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingEight" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a8"}
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="panel-heading" role="tab" id="serverFaqHeadingTen">
                                <h5 class="panel-title">
                                    <a role="button" class="btn btn-link collapsed" data-toggle="collapse" href="#serverFaqTen" aria-expanded="false" aria-controls="serverFaqTen">
                                        {lang key="store.threesixtymonitoring.faq.q10"}
                                    </a>
                                </h5>
                                <i class="fal fa-plus collapsed" data-toggle="collapse" href="#serverFaqTen" aria-expanded="false" aria-controls="serverFaqTen"></i>
                            </div>
                            <div id="serverFaqTen" class="panel-collapse collapse" role="tabpanel" aria-labelledby="serverFaqHeadingTen" data-parent="#serverFaqAccordion">
                                <div class="panel-body">
                                    {lang key="store.threesixtymonitoring.faq.a10"}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <div class="modal modal-results fade" id="modalTestResults" tabindex="-1" role="dialog" aria-labelledby="modalTestResultsTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title pull-left" id="modalTestResultsTitle">{lang key="store.threesixtymonitoring.modal.title"} <span class="span-modal-results"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="{lang key="close"}">
                        <span aria-hidden="true"><i class="fal fa-times"></i></span>
                    </button>
                </div>
                <div class="modal-body" style="background-image: url('{$WEB_ROOT}/assets/img/marketconnect/threesixtymonitoring/modal-bg.png')">
                    <div class="text-center">
                        <p>{lang key="store.threesixtymonitoring.modal.subtitle"}</p>
                        <div class="div-modal-border"></div>
                        <div class="div-results">
                            <div class="row">
                                <div class="col-xs-3">
                                    <span>{lang key="store.threesixtymonitoring.modal.currentStatus"}</span>
                                </div>
                                <div class="col-xs-3">
                                    <span>{lang key="store.threesixtymonitoring.modal.resolvingTime"}</span>
                                </div>
                                <div class="col-xs-3">
                                    <span>{lang key="store.threesixtymonitoring.modal.connectionTime"}</span>
                                </div>
                                <div class="col-xs-3">
                                    <span>{lang key="store.threesixtymonitoring.modal.totalTime"}</span>
                                </div>
                            </div>
                            <div class="row result-values">
                                <div class="col-xs-3">
                                    <span class="metric-value" data-metric="host_status" data-metric-type="label">Online</span>
                                </div>
                                <div class="col-xs-3">
                                    <span class="metric-value" data-metric="time_dns" data-metric-type="time">0.009S</span>
                                </div>
                                <div class="col-xs-3">
                                    <span class="metric-value" data-metric="time_connect" data-metric-type="time">0.013S</span>
                                </div>
                                <div class="col-xs-3">
                                    <span class="metric-value" data-metric="time_total" data-metric-type="time">1.257S</span>
                                </div>
                            </div>
                            <div class="row result-icons">
                                <div class="col-xs-3" data-metric="host_status">
                                    <div class="metric-icon result-positive">
                                        <i aria-hidden="true" class="fas fa-circle" title="{lang key="store.threesixtymonitoring.modal.positive"}"></i>
                                        <span class="sr-only">{lang key="store.threesixtymonitoring.modal.positive"}</span>
                                    </div>
                                </div>
                                <div class="col-xs-3" data-metric="time_dns">
                                    <div class="metric-icon result-positive">
                                        <i aria-hidden="true" class="fas fa-circle" title="{lang key="store.threesixtymonitoring.modal.positive"}"></i>
                                        <span class="sr-only">{lang key="store.threesixtymonitoring.modal.positive"}</span>
                                    </div>
                                </div>
                                <div class="col-xs-3" data-metric="time_connect">
                                    <div class="metric-icon result-positive">
                                        <i aria-hidden="true" class="fas fa-circle" title="{lang key="store.threesixtymonitoring.modal.positive"}"></i>
                                        <span class="sr-only">{lang key="store.threesixtymonitoring.modal.positive"}</span>
                                    </div>
                                </div>
                                <div class="col-xs-3" data-metric="time_total">
                                    <div class="metric-icon result-positive">
                                        <i aria-hidden="true" class="fas fa-circle" title="{lang key="store.threesixtymonitoring.modal.positive"}"></i>
                                        <span class="sr-only">{lang key="store.threesixtymonitoring.modal.positive"}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-legend">
                            <div class="col-xs-2 col-xs-offset-3">
                                <i class="fas fa-circle result-positive"></i>
                                <span>{lang key="store.threesixtymonitoring.modal.positive"}</span>
                            </div>
                            <div class="col-xs-2">
                                <i class="fas fa-circle result-concern"></i>
                                <span>{lang key="store.threesixtymonitoring.modal.concern"}</span>
                            </div>
                            <div class="col-xs-2">
                                <i class="fas fa-circle result-negative"></i>
                                <span>{lang key="store.threesixtymonitoring.modal.negative"}</span>
                            </div>
                        </div>
                        <a href="#websiteSectionPricing" class="btn btn-primary btn-pricing-scroll btn-modal-get-started">{lang key="store.threesixtymonitoring.button.getStarted"}</a>
                        <div class="div-cloneable-results d-none">
                            <div class="metric-icon result-positive">
                                <i aria-hidden="true" class="fas fa-circle" title="{lang key="store.threesixtymonitoring.modal.positive"}"></i>
                                <span class="sr-only">{lang key="store.threesixtymonitoring.modal.positive"}</span>
                            </div>
                            <div class="metric-icon result-concern">
                                <i aria-hidden="true" class="fas fa-circle" title="{lang key="store.threesixtymonitoring.modal.concern"}"></i>
                                <span class="sr-only">{lang key="store.threesixtymonitoring.modal.concern"}</span>
                            </div>
                            <div class="metric-icon result-negative">
                                <i aria-hidden="true" class="fas fa-circle" title="{lang key="store.threesixtymonitoring.modal.negative"}"></i>
                                <span class="sr-only">{lang key="store.threesixtymonitoring.modal.negative"}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
(function($) {
    $(document).ready(function() {
        $('#frmSiteCheck').submit(function() {
            var form = this;
            var btnSubmit = $(form).find('button[type=submit]');
            var url = jQuery(form).find('[name="url"]');
            var probe = jQuery(form).find('[name="probe_id"] option:selected');
            var searchBtnIcon = jQuery(form).find('i');

            if (probe.val().length == 0 || url.val().length == 0) {
                WHMCS.ui.effects.errorShake(searchBtnIcon);
                return false;
            }

            $(btnSubmit).find('.main-icon').hide();
            $(btnSubmit).find('.fa-spinner').show();

            WHMCS.http.jqClient.jsonPost({
                url: $(form).attr('action'),
                data: $(form).serialize(),
                success: function(response) {
                    var isHostUp = !response.result['down_now'];

                    jQuery('.modal-title .span-modal-results').text(
                        "https://" + url.val() + " — " + probe.text()
                    );

                    $('.result-values [data-metric]').each(function(index, metricElement) {
                        var metric = $(metricElement).data('metric');
                        var dataType = $(metricElement).data('metric-type');
                        var metricData = response.result[metric];

                        if (metricData && isHostUp) {
                            if (dataType === 'time') {
                                metricData.value = metricData.value + ' {lang key="dateTime.symbol.second"}';
                            }
                        } else if (!isHostUp && dataType === 'time') {
                            metricData = {
                                value: '---',
                                icon: 'negative'
                            };
                        }

                        $(metricElement).text(metricData.value);

                        jQuery('.result-icons').find('[data-metric="' + metric + '"] .metric-icon')
                            .replaceWith(jQuery('.div-cloneable-results .result-' + metricData.icon).clone());
                    });

                    $(modalTestResults).modal('show');
                },
                fail: function() {
                    WHMCS.ui.effects.errorShake(searchBtnIcon);
                },
                always: function() {
                    $(btnSubmit).find('.fa-spinner').hide();
                    $(btnSubmit).find('.main-icon').show();
                }
            });

            return false;
        });
        jQuery('.section-faq .btn-link, .section-faq i').on('click', function() {
            var isExpanded = jQuery(this).attr('aria-expanded');
            var toggleIcon = jQuery(this).closest('div').find('i');
            var allCards = jQuery(this).closest('section').find('i');
            if (isExpanded == 'true') {
                toggleIcon.removeClass('fa-minus').addClass('fa-plus');
            } else {
                allCards.each(function() {
                    jQuery(this).removeClass('fa-minus').addClass('fa-plus');
                });
                toggleIcon.removeClass('fa-plus').addClass('fa-minus');
            }
        });
        jQuery('.btn-pricing-scroll').on('click', function(event) {
            var element = jQuery(this);
            var targetId = element.attr('href');

            event.preventDefault();
            if (element.hasClass('btn-modal-get-started')) {
                jQuery('#modalTestResults').modal('hide');
            }
            jQuery('html, body').animate({
                scrollTop: jQuery(targetId).offset().top
            }, 500);
        });

        jQuery('#pills-website-tab, #pills-server-tab').on('click', function(event) {
            var element = jQuery(this);

            event.preventDefault();
            if (
                element.attr('id') == 'pills-website-tab'
                && jQuery('.section-header .tab-website').is(':hidden')
            ) {
                jQuery('.section-header .tab-server').hide();
                jQuery('.section-header .tab-website').fadeToggle();
            } else if (
                element.attr('id') == 'pills-server-tab'
                && jQuery('.section-header .tab-server').is(':hidden')
            ) {
                jQuery('.section-header .tab-website').hide();
                jQuery('.section-header .tab-server').fadeToggle();
            }
        });
        jQuery('.p-pricing-cta a').on('click', function(event) {
            var element = jQuery(this);
            var targetId = element.attr('href');

            event.preventDefault();
            if (targetId == '#serverSectionPricing') {
                jQuery('.section-header .tab-website').hide();
                jQuery('.section-header .tab-server').fadeToggle();
                jQuery('#pills-website').removeClass('active in');
                jQuery('#pills-server').addClass('active in');
                jQuery('#pills-website-tab').closest('li').removeClass('active').attr('aria-selected', 'false');
                jQuery('#pills-server-tab').closest('li').addClass('active').attr('aria-selected', 'true');
            } else {
                jQuery('.section-header .tab-server').hide();
                jQuery('.section-header .tab-website').fadeToggle();
                jQuery('#pills-server').removeClass('active in');
                jQuery('#pills-website').addClass('active in');
                jQuery('#pills-server-tab').closest('li').removeClass('active').attr('aria-selected', 'false');
                jQuery('#pills-website-tab').closest('li').addClass('active').attr('aria-selected', 'true');
            }
            jQuery('html, body').animate({
                scrollTop: jQuery(targetId).offset().top
            }, 0);
        });
    });
})(jQuery);
</script>
