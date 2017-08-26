<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page weebly">

    <div class="hero">
        <div class="container">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/logo.png">
            <h2>{lang key="store.websiteBuilder.headline"}</h2>
            <h3>{lang key="store.websiteBuilder.tagline"}</h3>
        </div>
    </div>

    <nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-landing-page" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="collapse navbar-collapse" id="nav-landing-page">
          <ul class="nav navbar-nav">
            <li><a href="#" onclick="smoothScroll('#overview');return false">Overview</a></li>
            <li><a href="#" onclick="smoothScroll('#features');return false">Features</a></li>
            <li><a href="#" onclick="smoothScroll('#pricing');return false">Pricing</a></li>
            <li><a href="#" onclick="smoothScroll('#faq');return false">FAQ</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="content-block image-standout" id="overview">
        <div class="container">
            <p class="lead text-center">{lang key="store.websiteBuilder.introduction"}</p>
            <br><br>
            <div class="row">
                <div class="col-sm-5">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/dragdropeditor.png">
                </div>
                <div class="col-sm-7">
                    <br><br>
                    <h3>Drag & Drop Builder</h3>
                    <p>The easy drag & drop builder allows you to create a professional website with no technical skills required. Choose different elements to add photos, maps or videos by just dragging and dropping them into place, right from your web browser.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block features" id="features">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/builder.png"></div>
                    <h4>Builder</h4>
                    <p>Create the perfect website with powerful drag and drop tools</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/ecommerce.png"></div>
                    <h4>Ecommerce</h4>
                    <p>Complete e-commerce solution to grow your business online</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/forms.png"></div>
                    <h4>Forms</h4>
                    <p>Create custom contact forms, RSVP lists and surveys</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/templates.png"></div>
                    <h4>Templates</h4>
                    <p>Professionally designed website templates with full customisation</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/gallery.png"></div>
                    <h4>Photos</h4>
                    <p>Create your own galleries, slideshows and custom backgrounds</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/blogging.png"></div>
                    <h4>Blogging</h4>
                    <p>Make an amazing blog in minutes</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/video.png"></div>
                    <h4>Video</h4>
                    <p>Embed video from popular services or host your own</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="feature">
                    <div class="icon"><img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/icons/seo.png"></div>
                    <h4>SEO</h4>
                    <p>Powerful SEO tools to help search engines find you</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block pricing" id="pricing">
        <div class="container">

            <div class="row">
                <div class="col-sm-9">
                    <div class="btn-group" role="group">
                        {foreach $billingCycles as $cycle}
                            <button type="button" class="btn btn-default cycle-change{if $cycle@first} active{/if}" data-cycle="{$cycle}">
                                {lang key={'orderpaymentterm'|cat:$cycle}}
                            </button>
                        {/foreach}
                    </div>
                    <br><br>
                </div>
                {if !$loggedin && $currencies}
                    <div class="col-sm-3">
                        <form method="post" action="">
                            <select name="currency" class="form-control currency-selector" onchange="submit()">
                                <option>Change Currency ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                                {foreach $currencies as $currency}
                                    <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                                {/foreach}
                            </select>
                        </form>
                    </div>
                {/if}
            </div>

            <div class="row weebly-plans">
                {if count($products) > 0}
                    {foreach $products as $key => $product}
                        <div class="{if count($products) == 1}col-sm-6 col-sm-offset-3{elseif count($products) == 2}col-sm-5{if $key == 0} col-sm-offset-1{/if}{else}col-sm-4{/if}">
                            <div class="pricing-item">
                                <div class="header">
                                    <h4>{$product->name}</h4>
                                    <h5>Ideal for {$product->idealFor}</h5>
                                </div>
                                <div class="price">
                                    {foreach $product->pricing()->allAvailableCycles() as $pricing}
                                        <span class="pricing-text {$pricing->cycle()}{if !$pricing@first} hidden{/if}">
                                            {$pricing->toFullString()}
                                        </span>
                                    {/foreach}
                                    <span class="pricing-text not-available hidden">
                                        -
                                    </span>
                                </div>
                                <div class="feature-heading">Site Features</div>
                                <ul class="site-features">
                                    {foreach $product->siteFeatures as $feature}
                                        <li>
                                            {$feature}
                                        </li>
                                    {/foreach}
                                </ul>
                                <div class="feature-heading">eCommerce Features</div>
                                <ul class="ecommerce-features">
                                    {foreach $product->ecommerceFeatures as $feature}
                                        <li>
                                            {$feature}
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                            <form method="post" action="{routePath('store-order')}">
                                <input type="hidden" name="pid" value="{$product->id}">
                                <input type="hidden" name="billingcycle" value="">
                                <button type="submit" class="btn btn-primary btn-block btn-signup">Signup</button>
                            </form>
                        </div>
                    {/foreach}
                {elseif $inPreview}
                    <div class="col-xs-12 lead text-center">
                        Weebly plans you activate will be displayed here
                    </div>
                {/if}
            </div>

        </div>
    </div>

    <div class="content-block faq" id="faq">
        <div class="container">
            <h3 class="text-center">Frequently Asked Questions</h3>
            <div class="row">
                <div class="col-md-4">
                    <h4>Can I create a blog?</h4>
                    <p>Yes the website builder allows you to include blog functionality.</p>
                    <hr>
                    <h4>Will my site be mobile friendly?</h4>
                    <p>Yes all websites created with the Weebly site builder are optimised for mobile.</p>
                    <hr>
                    <h4>Can I add photos to my website?</h4>
                    <p>Yes, you can add photos to your site, but HD Video and Audio are only available on Pro & Business plans.</p>
                    <div class="hidden-md hidden-lg"><hr></div>
                    </div>
                    <div class="col-md-4">
                    <h4>Can I sell products through my site?</h4>
                    <p>Yes eCommerce functionality is included with all plans but the number of products you can offer varies.</p>
                    <hr>
                    <h4>Can I add forms to my site?</h4>
                    <p>Yes the Weebly site builder makes it easy to create contact forms, RSVP lists, surveys and more.</p>
                    <hr>
                    <h4>How do I get my site into search engines?</h4>
                    <p>All Weebly powered websites include powerful SEO tools to help maximise your search engine ranking.</p>
                    <div class="hidden-md hidden-lg"><hr></div>
                    </div>
                    <div class="col-md-4">
                    <h4>Are there multiple styles to choose from?</h4>
                    <p>Yes there are multiple pre-made templates for you to choose from.</p>
                    <hr>
                    <h4>Can I upgrade?</h4>
                    <p>Yes you can upgrade at any time. Simply login to your account and choose the upgrade option.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block trusted-by">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/logo.png">
                </div>
                <div class="col-sm-7 text-right">
                    Trusted by over 40,000,000 people worldwide
                </div>
            </div>
        </div>
    </div>

</div>

<script src="{$WEB_ROOT}/templates/{$template}/store/weebly/master.js"></script>
