<link href="{assetPath file='store.css'}?v={$versionHash}" rel="stylesheet">

<div class="landing-page xovinow">
    <div class="header text-center text-lg-left mb-xl-5">
        <div class="container">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/logo-inverse.png">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/header-img.png" class="header-img d-none d-lg-inline">
            <h1>{lang key="store.xoviNow.tagline" lineBreak='<div class="d-none d-lg-block"></div>'}</h1>
            <button class="btn btn-lg btn-xovinow btn-stretched" onclick="smoothScroll('#cpsPricing')">
                {lang key="store.xoviNow.getStarted"}
            </button>
        </div>
    </div>

    <div class="content-block feature-carousel mt-lg-3">
        <div class="carousel-container">
            <h2 class="mt-md-4 mb-4 mb-md-5">{lang key="store.xoviNow.productTourTitle"}</h2>

            <div id="xovinow-screenshots" class="carousel slide" data-ride="carousel" data-interval="10000">
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/dashboard.png">
                    </div>
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/rankings.png">
                    </div>
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/keyword_research_keywords.png">
                    </div>
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/tracked_keywords.png">
                    </div>
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/projects.png">
                    </div>
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/site_audit.png">
                    </div>
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/advisor_overview_column.png">
                    </div>
                    <div class="item">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/screenshots/advisor_task_details.png">
                    </div>
                </div>
                <a class="left carousel-control" href="#xovinow-screenshots" role="button" data-slide="prev">
                    <span class="fas fa-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">{lang key="tablepagesprevious"}</span>
                </a>
                <a class="right carousel-control" href="#xovinow-screenshots" role="button" data-slide="next">
                    <span class="fas fa-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">{lang key="tablepagesnext"}</span>
                </a>
            </div>
        </div>
        <div class="container">
            <h3 class="mt-sm-3 mt-md-5 text-center"><p>{lang key="store.xoviNow.measureResultsTitle"}</h3>
            <br>
            <div class="row">
                <div class="col-lg-6">
                    <p>{lang key="store.xoviNow.measureResults1" startBold="<strong>" endBold="</strong>"}</p>
                </div>
                <div class="col-lg-6">
                    <p>{lang key="store.xoviNow.measureResults2" startBold="<strong>" endBold="</strong>"}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="content-block feature-tabs bg-white">
        <div class="container">

            <ul class="nav nav-tabs mt-sm-4 mt-md-4 mt-lg-5" role="tablist">
                <li role="presentation" class="active"><a href="#keywords" aria-controls="keywords" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.keywords.title"}</a></li>
                <li role="presentation"><a href="#advisor" aria-controls="advisor" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.advisor.title"}</a></li>
                <li role="presentation"><a href="#ranktracker" aria-controls="ranktracker" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.rankTracker.title"}</a></li>
                <li role="presentation"><a href="#siteaudit" aria-controls="siteaudit" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.siteAudit.title"}</a></li>
                <li role="presentation"><a href="#textoptimizer" aria-controls="textoptimizer" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.textOptimizer.title"}</a></li>
                <li role="presentation"><a href="#benchmarking" aria-controls="benchmarking" role="tab" data-toggle="tab">{lang key="store.xoviNow.features.benchmarking.title"}</a></li>
            </ul>

            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="keywords">
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/keywords.svg">
                        </div>
                        <div class="col-sm-6">
                            <h3>{lang key="store.xoviNow.features.keywords.title"}</h3>
                            <p>{lang key="store.xoviNow.features.keywords.line1"}</p>
                            <ul>
                                <li>{lang key="store.xoviNow.features.keywords.bullet1"}</li>
                                <li>{lang key="store.xoviNow.features.keywords.bullet2"}</li>
                                <li>{lang key="store.xoviNow.features.keywords.bullet3"}</li>
                                <li>{lang key="store.xoviNow.features.keywords.bullet4"}</li>
                                <li>{lang key="store.xoviNow.features.keywords.bullet5"}</li>
                                <li>{lang key="store.xoviNow.features.keywords.bullet6"}</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="advisor">
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/advisor.svg">
                        </div>
                        <div class="col-sm-6">
                            <h3>{lang key="store.xoviNow.features.advisor.title"}</h3>
                            <p>{lang key="store.xoviNow.features.advisor.line1"}</p>
                            <ul>
                                <li>{lang key="store.xoviNow.features.advisor.bullet1"}</li>
                                <li>{lang key="store.xoviNow.features.advisor.bullet2"}</li>
                                <li>{lang key="store.xoviNow.features.advisor.bullet3"}</li>
                                <li>{lang key="store.xoviNow.features.advisor.bullet4"}</li>
                                <li>{lang key="store.xoviNow.features.advisor.bullet5"}</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="ranktracker">
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/rank-tracker.svg">
                        </div>
                        <div class="col-sm-6">
                            <h3>{lang key="store.xoviNow.features.rankTracker.title"}</h3>
                            <p>{lang key="store.xoviNow.features.rankTracker.line1"}</p>
                            <ul>
                                <li>{lang key="store.xoviNow.features.rankTracker.bullet1"}</li>
                                <li>{lang key="store.xoviNow.features.rankTracker.bullet2"}</li>
                                <li>{lang key="store.xoviNow.features.rankTracker.bullet3"}</li>
                                <li>{lang key="store.xoviNow.features.rankTracker.bullet4"}</li>
                                <li>{lang key="store.xoviNow.features.rankTracker.bullet5"}</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="siteaudit">
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/site-audit.svg">
                        </div>
                        <div class="col-sm-6">
                            <h3>{lang key="store.xoviNow.features.siteAudit.title"}</h3>
                            <p>{lang key="store.xoviNow.features.siteAudit.line1"}</p>
                            <ul>
                                <li>{lang key="store.xoviNow.features.siteAudit.bullet1"}</li>
                                <li>{lang key="store.xoviNow.features.siteAudit.bullet2"}</li>
                                <li>{lang key="store.xoviNow.features.siteAudit.bullet3"}</li>
                                <li>{lang key="store.xoviNow.features.siteAudit.bullet4"}</li>
                                <li>{lang key="store.xoviNow.features.siteAudit.bullet5"}</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="textoptimizer">
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/text-optimizer.svg">
                        </div>
                        <div class="col-sm-6">
                            <h3>{lang key="store.xoviNow.features.textOptimizer.title"}</h3>
                            <p>{lang key="store.xoviNow.features.textOptimizer.line1"}</p>
                            <ul>
                                <li>{lang key="store.xoviNow.features.textOptimizer.bullet1"}</li>
                                <li>{lang key="store.xoviNow.features.textOptimizer.bullet2"}</li>
                                <li>{lang key="store.xoviNow.features.textOptimizer.bullet3"}</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="benchmarking">
                    <div class="row">
                        <div class="col-sm-6 text-center">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/benchmarking.svg">
                        </div>
                        <div class="col-sm-6">
                            <h3>{lang key="store.xoviNow.features.benchmarking.title"}</h3>
                            <p>{lang key="store.xoviNow.features.benchmarking.line1"}</p>
                            <ul>
                                <li>{lang key="store.xoviNow.features.benchmarking.bullet1"}</li>
                                <li>{lang key="store.xoviNow.features.benchmarking.bullet2"}</li>
                                <li>{lang key="store.xoviNow.features.benchmarking.bullet3"}</li>
                                <li>{lang key="store.xoviNow.features.benchmarking.bullet4"}</li>
                                <li>{lang key="store.xoviNow.features.benchmarking.bullet5"}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-block audience text-center">
        <div class="container">
            <div class="row mt-lg-3 mb-lg-3">
                <div class="col-sm-6">
                    <i class="fas fa-users"></i>
                    <h3>{lang key="store.xoviNow.audience.freelancersTitle"}</h3>
                    <p>{lang key="store.xoviNow.audience.freelancersDesc"}</p>
                </div>
                <div class="col-sm-6">
                    <i class="fas fa-briefcase"></i>
                    <h3>{lang key="store.xoviNow.audience.smbizTitle"}</h3>
                    <p>{lang key="store.xoviNow.audience.smbizDesc"}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="content-block pricing bg-white" id="cpsPricing">
        <div class="container">
            <div class="money-back text-center mt-4 mb-4 mt-sm-5 mb-sm-5">
                {lang key="store.xoviNow.moneyBackGuarantee" guaranteeStart="<br><span>" guaranteeEnd="</span>"}
            </div>

            <div class="row justify-content-md-center">
                <div class="col-xl-10">
                    <div class="row no-gutters">
                        <div class="col-sm-4 d-none d-md-block">
                            <div class="plan-features">
                                <div class="plan-header">
                                    <img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/logo.png">
                                </div>
                                {foreach $plans[0]->features as $feature => $value}
                                    <div class="plan-feature{if is_bool($value)} || $value < 2} row-highlight{/if}">
                                        {lang key="store.xoviNow.featurematrix."|cat:$value@iteration}
                                    </div>
                                {/foreach}
                            </div>
                        </div>
                        {foreach $plans as $plan}
                            <div class="col-sm-4 col-xs-12">
                                <div class="plan{if $plan->is_featured} featured{/if}">
                                    <div class="plan-header">
                                        <div class="plan-name">
                                            {$plan->productGroup->name}
                                            {$plan->name}
                                        </div>
                                        <div class="plan-price">
                                            {if $plan->isFree()}
                                                {lang key='orderpaymenttermfree'}
                                            {elseif $plan->pricing()->first()}
                                                {$plan->pricing()->first()->toPrefixedString()}
                                            {else}
                                                -
                                            {/if}
                                        </div>
                                    </div>
                                    {foreach $plan->features as $feature => $value}
                                        <div class="plan-feature{if is_bool($value)} || $value < 2} row-highlight{/if}">
                                            {if is_bool($value)}
                                                <i class="fas fa-circle d-none d-md-inline"></i>
                                                <i class="fas fa-check  d-md-none"></i>
                                            {else}
                                                {$value}
                                            {/if}
                                            <span class="d-md-none">{lang key="store.xoviNow.featurematrix."|cat:$value@iteration}</span>
                                        </div>
                                    {/foreach}
                                    <div class="buy-btn">
                                        <form action="{routePath('cart-order')}" method="post">
                                            <input type="hidden" name="pid" value="{$plan->id}">
                                            <button type="submit" class="btn {if $plan->is_featured}btn-xovinow{else}btn-default{/if}">
                                                {lang key="ordernowbutton"}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="content-block faq">
        <div class="container">

            <h3 class="text-center">{lang key="store.xoviNow.faqTitle"}</h3>

            <div class="row justify-content-md-center">
                <div class="col-lg-10 col-xl-8">
                    <div class="panel-group" id="xovinowFAQ" role="tablist">
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading1">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse1" aria-expanded="true" aria-controls="collapse1">
                                        {lang key="store.xoviNow.faq1"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq1ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading2">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse2" aria-expanded="false" aria-controls="collapse2">
                                        {lang key="store.xoviNow.faq2"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading2" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq2ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading3">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse3" aria-expanded="false" aria-controls="collapse3">
                                        {lang key="store.xoviNow.faq3"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq3ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading4">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse4" aria-expanded="true" aria-controls="collapse4">
                                        {lang key="store.xoviNow.faq4"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq4ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading5">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse5" aria-expanded="true" aria-controls="collapse5">
                                        {lang key="store.xoviNow.faq5"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq5ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading6">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse6" aria-expanded="true" aria-controls="collapse6">
                                        {lang key="store.xoviNow.faq6"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading6" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq6ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading7">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse7" aria-expanded="true" aria-controls="collapse7">
                                        {lang key="store.xoviNow.faq7"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading7" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq7ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading8">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse8" aria-expanded="true" aria-controls="collapse8">
                                        {lang key="store.xoviNow.faq8"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse8" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading8" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq8ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading9">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse9" aria-expanded="true" aria-controls="collapse9">
                                        {lang key="store.xoviNow.faq9"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading9" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq9ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading10">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse10" aria-expanded="true" aria-controls="collapse10">
                                        {lang key="store.xoviNow.faq10"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse10" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading10" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq10ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading11">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse11" aria-expanded="true" aria-controls="collapse11">
                                        {lang key="store.xoviNow.faq11"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse11" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading11" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq11ans" image1='<img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/faq-advisor.png">' image2='<img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/faq-googlectrchart.png">' image3='<img src="{$WEB_ROOT}/assets/img/marketconnect/xovinow/faq-googlectrpages.png">' googleWebmasterGuidelinesUrl="https://developers.google.com/search/docs/advanced/guidelines/webmaster-guidelines" waybackMachineUrl="https://archive.org/web/"}
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" id="heading12">
                                <h2 class="panel-title mb-0">
                                    <a class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-parent="#xovinowFAQ" href="#collapse12" aria-expanded="true" aria-controls="collapse12">
                                        {lang key="store.xoviNow.faq12"}
                                    </a>
                                </h2>
                            </div>
                            <div id="collapse12" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading12" data-parent="#xovinowFAQ">
                                <div class="panel-body">
                                    {lang key="store.xoviNow.faq12ans" image1=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-advisor.png' image2=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrchart.png' image3=$WEB_ROOT|cat:'/assets/img/marketconnect/xovinow/faq-googlectrpages.png'}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>