<link href="{assetPath file='store.css'}" rel="stylesheet">

<div class="landing-page marketgoo">
    <div class="hero">
        <div class="container">
            <div class="logo">
                <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/logo.svg">
            </div>
            <h2 class="strong-green">{lang key="store.marketgoo.headline"}</h2>
            <h2>{lang key="store.marketgoo.tagline"}</h2>
        </div>
    </div>

    <div class="video-banner">
        <div class="container">
            <div class="embed-responsive">
                <iframe src="https://player.vimeo.com/video/394484913" class="embed-responsive-item" allow="autoplay; fullscreen" allowfullscreen></iframe>
            </div>
        </div>
    </div>

    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-landing-page" aria-expanded="false">
                    <span class="sr-only">{lang key="toggleNav"}</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="nav-landing-page">
                <ul class="nav navbar-nav">
                    <li><a href="#" onclick="smoothScroll('#how');return false">{lang key="store.marketgoo.tab.how"}</a></li>
                    <li><a href="#" onclick="smoothScroll('#features');return false">{lang key="store.marketgoo.tab.features"}</a></li>
                    <li><a href="#" onclick="smoothScroll('#testimonials');return false">{lang key="store.marketgoo.tab.testimonials"}</a></li>
                    <li><a href="#" onclick="smoothScroll('#faqs');return false">{lang key="store.marketgoo.tab.faqs"}</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content-block feature-blocks" id="how">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/1-signup.svg">
                        <span>1. {lang key="store.marketgoo.features.1"}</span>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/2-get-seo-plan.svg">
                        <span>2. {lang key="store.marketgoo.features.2"}</span>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="block">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/3-follow-instructions.svg">
                        <span>3. {lang key="store.marketgoo.features.3"}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block feature-blocks">
        <div class="container">
            <div class="feature-wrapper">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="block">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/4-start-improving.svg">
                            <span>4. {lang key="store.marketgoo.features.4"}</span>
                            <p>{lang key="store.marketgoo.featuresdetail.4"}</p>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="block">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/5-track-monitor.svg">
                            <span>5. {lang key="store.marketgoo.features.5"}</span>
                            <p>{lang key="store.marketgoo.featuresdetail.5"}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block" id="features">
        <div class="container">
            {if count($plans) > 0}
                <div class="visible-xs">
                    <form method="post" action="">
                        <select name="currency" class="form-control" onchange="submit()">
                            <option>{lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                            {foreach $currencies as $currency}
                                <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                            {/foreach}
                        </select>
                    </form>
                    <br><br>
                </div>
                <div class="plan-container">
                    {foreach $plans as $plan}
                        <div class="plan labels">
                            <div class="header">
                                {if !$loggedin && $currencies}
                                    <br>
                                    <form method="post" action="" class="hidden-xs">
                                        <select name="currency" class="form-control currency-selector" onchange="submit()">
                                            <option>{lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                                            {foreach $currencies as $currency}
                                                <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                                            {/foreach}
                                        </select>
                                    </form>
                                {/if}
                            </div>
                            <ul>
                                {foreach $plan->features as $label => $value}
                                    <li><span>{lang key="store.marketgoo.featurematrix."|cat:$value@iteration}</span></li>
                                {/foreach}
                            </ul>
                        </div>
                        <div class="plan {$plan->configoption1}">
                            <div class="header">
                                <h4>
                                    <span>{$plan->name}</span>
                                    <span class="best-value">{lang key='store.marketgoo.labelBestValue'}</span>
                                </h4>
                                <span class="pricing">
                                    {if $plan->isFree()}
                                        {lang key='orderpaymenttermfree'}
                                    {elseif $plan->pricing()->first()}
                                        {$plan->pricing()->first()->toPrefixedString()}
                                    {else}
                                        -
                                    {/if}
                                </span>
                            </div>
                            <ul>
                                {foreach $plan->features as $label => $value}
                                    <li>
                                        {if is_bool($value)}
                                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/icon-check.svg">
                                        {else}
                                            {$value}
                                        {/if}
                                    </li>
                                {/foreach}
                            </ul>
                            <form action="{routePath('cart-order')}" method="post">
                                <input type="hidden" name="pid" value="{$plan->id}">
                                <button type="submit" class="btn btn-primary btn-signup">
                                    {lang key='store.marketgoo.signup'}
                                </button>
                            </form>
                        </div>
                    {/foreach}
                </div>
            {elseif $inPreview}
                <div class="lead text-center">
                    {lang key="store.marketgoo.adminPreview"}
                </div>
            {/if}
        </div>
    </div>

    <div class="content-block testimonials" id="testimonials">
        <div class="container">
            <div id="marketgoo-testimonials" class="carousel slide" data-ride="carousel" data-interval="10000">
                <ol class="carousel-indicators">
                    <li data-target="#marketgoo-testimonials" data-slide-to="0" class="active"></li>
                    <li data-target="#marketgoo-testimonials" data-slide-to="1"></li>
                    <li data-target="#marketgoo-testimonials" data-slide-to="2"></li>
                    <li data-target="#marketgoo-testimonials" data-slide-to="3"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <div class="testimonial">
                            "marketgoo made the complicated simple for me. I never knew where to start with SEO until I started using this service. Literally, I more than doubled my traffic when I started using this."
                        </div>
                        <div class="user">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/user-testimonial-1.jpg">
                            <div class="bio">
                                <span>Heather Figi</span>
                                <em>Music for Young Violinists</em>
                                <a href="https://www.marketgoo.com/blog-post/2018/08/30/review-music-for-violinists/" target="_blank">{lang key="store.marketgoo.testimonials.casestudy"}</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial">
                            "Without marketgoo I would never have been able to have my website on the first page of google for all the keywords that are linked to my business, its ease of use and the customer service when I’ve needed help has been first class."
                        </div>
                        <div class="user">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/user-testimonial-2.jpg">
                            <div class="bio">
                                <span>Ian Glass</span>
                                <em>Ian Glass Fitness</em>
                                <a href="https://www.marketgoo.com/blog-post/2019/10/29/review-ian-glass-fitness/" target="_blank">{lang key="store.marketgoo.testimonials.casestudy"}</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial">
                            "Such a simple reliable platform! It’s helped me see where we stand next to our local competitors. Its part of our day to day. The best feature is the keyword tool."
                        </div>
                        <div class="user">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/user-testimonial-3.jpg">
                            <div class="bio">
                                <span>Simon Saleh</span>
                                <em>Wanderlust Ironworks</em>
                                <a href="https://www.marketgoo.com/blog-post/2019/09/09/review-wanderlust-ironworks/" target="_blank">{lang key="store.marketgoo.testimonials.casestudy"}</a>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial">
                            "marketgoo reports give me everything I need to know for my site’s SEO. I am constantly fine tuning my site to work towards a higher rating. I read various marketgoo reports then immediately work out how to implement recommendations."
                        </div>
                        <div class="user">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/user-testimonial-4.jpg">
                            <div class="bio">
                                <span>Svein Koningen</span>
                                <em>Koningen Art</em>
                                <a href="https://www.marketgoo.com/blog-post/2018/06/24/marketgoo-review-koningen-art/" target="_blank">{lang key="store.marketgoo.testimonials.casestudy"}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block faqs" id="faqs">
        <div class="container">
            <h3 class="text-center">{lang key="store.marketgoo.faqs.title"}</h3>
            <div class="row">
                <div class="col-md-4">
                    <div class="faq">
                        <h4>{lang key="store.marketgoo.faqs.q1"}</h4>
                        <p>{lang key="store.marketgoo.faqs.a1"}</p>
                        <a href="https://vimeo.com/whmcs/marketgoo-lite-vs-pro" target="_blank">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/marketgoo/video-comparison.png">
                        </a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="faq">
                        <h4>{lang key="store.marketgoo.faqs.q2"}</h4>
                        <p>{lang key="store.marketgoo.faqs.a2"}</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="faq">
                        <h4>{lang key="store.marketgoo.faqs.q3"}</h4>
                        <p>{lang key="store.marketgoo.faqs.a3"}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
