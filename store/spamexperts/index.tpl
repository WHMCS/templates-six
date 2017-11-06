<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page mail-services">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.emailServices.headline"}</h2>
            <h3>{lang key="store.emailServices.tagline"}</h3>
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
            <li><a href="#" onclick="smoothScroll('#howitworks');return false">How It Works</a></li>
            <li><a href="#" onclick="smoothScroll('#pricing');return false">Pricing</a></li>
            <li><a href="#" onclick="smoothScroll('#faq');return false">FAQ</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="product-options" id="overview">
        <div class="container">
            {if $numberOfFeaturedProducts > 0}
                <div class="row">
                    {if $products.incoming}
                        <div class="{if $numberOfFeaturedProducts == 1}col-sm-6 col-sm-offset-3{elseif $numberOfFeaturedProducts == 2}col-sm-6{else}col-sm-6 col-md-4{/if}">
                            <div class="item">
                                <h4>Incoming Email Filtering</h4>
                                <div class="icon">
                                    <i class="fa fa-envelope-open-o"></i>
                                </div>
                                <span>Protect your network</span>
                                <p>Eliminate Spam & Viruses from email before they ever reach your network</p>
                                {if $products.incoming->pricing()->best()}
                                    <div class="price">From {$products.incoming->pricing()->best()->toFullString()}/domain</div>
                                {/if}
                                <a href="#" class="btn btn-learn-more" data-target="incoming">
                                    Learn more
                                </a>
                                <a href="#" class="btn btn-buy" data-target="incoming">
                                    Buy
                                </a>
                            </div>
                        </div>
                    {/if}
                    {if $products.outgoing}
                        <div class="{if $numberOfFeaturedProducts == 1}col-sm-6 col-sm-offset-3{elseif $numberOfFeaturedProducts == 2}col-sm-6{else}col-sm-6 col-md-4{/if}">
                            <div class="item">
                                <h4>Outgoing Email Filtering</h4>
                                <div class="icon">
                                    <i class="fa fa-envelope-open"></i>
                                </div>
                                <span>Safeguard your reputation</span>
                                <p>Prevent Spam & Viruses from ever unknowingly leaving your network</p>
                                {if $products.outgoing->pricing()->best()}
                                    <div class="price">From {$products.outgoing->pricing()->best()->toFullString()}/domain</div>
                                {/if}
                                <a href="#" class="btn btn-learn-more" data-target="outgoing">
                                    Learn more
                                </a>
                                <a href="#" class="btn btn-buy" data-target="outgoing">
                                    Buy
                                </a>
                            </div>
                        </div>
                    {/if}
                    {if $products.incomingarchiving || $products.outgoingarchiving || $products.incomingoutgoingarchiving}
                        <div class="{if $numberOfFeaturedProducts == 1}col-sm-6 col-sm-offset-3{elseif $numberOfFeaturedProducts == 2}col-sm-6{else}col-sm-6 col-md-4{/if}">
                            <div class="item">
                                <h4>Email Archiving</h4>
                                <div class="icon">
                                    <i class="fa fa-cube"></i>
                                </div>
                                <span>Backup and Compliance</span>
                                <p>Never lose an email again and ensure email data integrity for legal compliance</p>
                                {if $products.incomingarchiving && $products.incomingarchiving->pricing()->best()}
                                    <div class="price">From {$products.incomingarchiving->pricing()->best()->toFullString()}/domain</div>
                                {elseif $products.outgoingarchiving && $products.outgoingarchiving->pricing()->best()}
                                    <div class="price">From {$products.outgoingarchiving->pricing()->best()->toFullString()}/domain</div>
                                {else}
                                    <div class="price">From {$products.incomingoutgoingarchiving->pricing()->best()->toFullString()}/domain</div>
                                {/if}
                                <a href="#" class="btn btn-learn-more" data-target="archiving">
                                    Learn more
                                </a>
                                <a href="#" class="btn btn-buy" data-target="incomingoutgoingarchiving">
                                    Buy
                                </a>
                            </div>
                        </div>
                    {/if}
                </div>
            {elseif $inPreview}
                <div class="text-center lead preview-text">Email service products you activate will be displayed here</div>
            {/if}
            <div class="powered-by">
                Powered by <img src="{$WEB_ROOT}/assets/img/marketconnect/spamexperts/logo_white.png">
            </div>
        </div>
    </div>

    <div class="content-block text20 text-center">
        <div class="container">
            <h2>{lang key="store.emailServices.blockSpamHeadline"}</h2>
        </div>
    </div>

    <div class="content-block tabs light-grey-bg" id="howitworks">
        <div class="container">
                <ul class="nav nav-tabs" role="tablist">
                    {if $products.incoming || $inPreview}
                        <li role="presentation" class="active">
                            <a href="#incoming" aria-controls="incoming" role="tab" data-toggle="tab">Incoming Email Filtering</a>
                        </li>
                    {/if}
                    {if $products.outgoing || $inPreview}
                        <li role="presentation">
                            <a href="#outgoing" aria-controls="outgoing" role="tab" data-toggle="tab">Outgoing Email Filtering</a>
                        </li>
                    {/if}
                    {if $products.incomingarchiving || $products.outgoingarchiving || $inPreview}
                        <li role="presentation">
                            <a href="#archiving" aria-controls="archiving" role="tab" data-toggle="tab">Email Archiving</a>
                        </li>
                    {/if}
                </ul>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="incoming">

                        <div class="benefits">
                            <h3>Incoming email filtering gives you all these benefits...</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Full Inbox protection at competitive prices
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Extremely accurate filtering
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Easy configuration
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Increase inbound email continuity & redundancy
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Various reporting options
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Friendly interface to keep you in full control over your email
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Increase employee productivity
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Compatible with any mail server
                                </div>
                            </div>
                        </div>

                        <h3>Why Choose SpamExperts Incoming Filter?</h3>
                        <p>Incoming Email Filtering filters all inbound email and eliminates spam & viruses before these threats reach your network at a nearly 100% accuracy rate. The extensive control-panel allows you to remain in full control. Moreover, in case your email server is down, your email will be queued. Queued email can be accessed, read, and replied to via the web-interface adding to your inbound email continuity!</p>

                        <h3>Why do you need a professional Incoming Filter?</h3>

                        <p>Stop running the risk of IT network threats. If your Inbox is crowded with unsolicited bulk mail every day, then that's a sign you need a professional Incoming Filter solution. Get full protection for your Inbox and say goodbye to spam, virus and malware threats!</p>

                        <h3>How it works</h3>

                        <p>Once your domain is (automatically) deployed to the Incoming Filter, and filtering is activated, email will pass through the SpamExperts filtering cloud. Incoming emails are securely analyzed and scanned in real time. No training or configurations are required and everything works out of the box. Any message detected as spam is moved to the quarantine, while non-spam is sent to your email server. The quarantine can be monitored in the user-friendly SpamPanel, through email-reports, or even directly in your email client! No more wasted time in dealing with spam, simply focus your energy on business tasks, while you remain in full control.</p>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="outgoing">

                        <div class="benefits">
                            <h3>Outgoing email filtering gives you all these benefits...</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    No more blacklisting
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Protect the reputation of your brand and IT-systems
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Avoid de-listing related costs
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Increase outbound email continuity and delivery
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Enhance employee productivity
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Improve abuse manageability
                                </div>
                            </div>
                        </div>

                        <h3>What is outgoing filtering?</h3>

                        <p>Outgoing Email Filtering is vital to safeguard your IT infrastructure reputation and ensure all your outgoing email arrives safely where it should. This professional solution will block spam & viruses from leaving your network and prevent your IP(s) from being blacklisted ever again. Moreover, the SpamExperts Outgoing Filter gives you the reporting and tools to detect compromised accounts and lock-down spamming users.</p>

                        <h3>Why you need it?</h3>

                        <p>Has your network ever sent out spam email without your knowledge? Due to network weaknesses almost any device can be compromised to transmit outbound SMTP, allowing spam or malware to be sent out from your network without you even knowing it! Therefore, it's critical you invest in a professional Outgoing Filter solution. Maintain your company’s good reputation, stop spam from leaving your network and prevent being blacklisted so that your email always arrives where it is meant to go.</p>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="archiving">

                        <div class="benefits">
                            <h3>Email archiving gives you all these benefits...</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Includes Incoming & Outcoming Email Filtering!
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Never lose an email again!
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Achieve legal compliance
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Improve IT system performance
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    User friendly data-protection management
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Added email continuity, journaling support, and easy re-delivery
                                </div>
                                <div class="col-md-6">
                                    <i class="fa fa-check"></i>
                                    Compressed, encrypted and secure archive
                                </div>
                            </div>
                        </div>

                        <h3>Email Archiving</h3>

                        <p>Email Archiving preserves and protects all inbound and outbound email messages for later access. It is a great way to recover lost or accidentally deleted emails, accelerate audit response, secure intellectual property emails and attachments, as well as for “eDiscovery” purposes in case of litigation.</p>

                        <h3>Why you need it</h3>

                        <p>Are you desperately looking for an important email from last year, but can’t seem to find it and you’re risking a fine or losing an important business deal as the result of this? Prevent this with a professional Email Archiving solution. Email Archiving is a critical tool to preserve a secure backup of all email and be legally compliant.</p>
                        <p>At the same time, as email exchanges have judicial power and are legally binding, email compliance has become an extremely important concern for organizations. Therefore it is mandatory in certain industries to preserve a secure backup of all email messages and be legally compliant.</p>

                    </div>
                </div>
        </div>
    </div>

    <div class="content-block get-started" id="pricing">
        <div class="container">
            <form method="post" action="{routePath('store-order')}">
                <input type="hidden" name="productkey" value="{$products.incoming->productKey}" id="productKey">
                <div class="row">
                    <div class="col-sm-8">
                        <h2>Signup and Get Started</h2>
                        <h4>Choose Product</h4>
                        {if $numberOfFeaturedProducts > 0}
                            <div class="btn-group choose-product" role="group">
                                {if $products.incoming}
                                    <button type="button" class="btn btn-default active" data-product="incoming">Incoming Filtering</button>
                                {/if}
                                {if $products.outgoing}
                                    <button type="button" class="btn btn-default" data-product="outgoing">Outgoing Filtering</button>
                                {/if}
                            </div>
                        {elseif $inPreview}
                            Email service products you activate will display here
                        {/if}
                        <br><br>
                        <h4>Additional Options</h4>
                        <div class="additional-options">
                            {foreach $productOptions as $productKey => $options}
                                <div class="option options-{$productKey}">
                                    {foreach $options as $option}
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="options" value="{$option.product}">
                                            {$option.description} for <span>just {$option.pricing->toFullString()} more</span>
                                        </label><br>
                                    {foreachelse}
                                        None available
                                    {/foreach}
                                </div>
                            {/foreach}
                        </div>
                    </div>
                    <div class="col-sm-4 text-right">
                        {if $products.incoming && $products.incoming->pricing()->best()}
                            <span class="price price-incoming">{$products.incoming->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.incomingarchiving && $products.incomingarchiving->pricing()->best()}
                            <span class="price price-incomingarchiving">{$products.incomingarchiving->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.outgoing && $products.outgoing->pricing()->best()}
                            <span class="price price-outgoing">{$products.outgoing->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.outgoingarchiving && $products.outgoingarchiving->pricing()->best()}
                            <span class="price price-outgoingarchiving">{$products.outgoingarchiving->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.incomingoutgoing && $products.incomingoutgoing->pricing()->best()}
                            <span class="price price-incomingoutgoing">{$products.incomingoutgoing->pricing()->best()->toFullString()}</span>
                        {/if}
                        {if $products.incomingoutgoingarchiving && $products.incomingoutgoingarchiving->pricing()->best()}
                            <span class="price price-incomingoutgoingarchiving">{$products.incomingoutgoingarchiving->pricing()->best()->toFullString()}</span>
                        {/if}
                        <br><br><br><br><br>
                        <button type="submit" class="btn btn-order-now btn-lg">
                            Order Now
                        </button>
                    </div>
                </div>
            </form>

            {if !$loggedin && $currencies}
                <br>
                <form method="post" action="">
                    <select name="currency" class="form-control ssl-currency-selector" onchange="submit()" style="width:250px;">
                        <option>Change Currency ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                        {foreach $currencies as $currency}
                            <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                        {/foreach}
                    </select>
                </form>
            {/if}

        </div>
    </div>

    <div class="content-block faq" id="faq">
        <div class="container">
            <h3 class="text-center">Frequently Asked Questions</h3>
            <div class="row">
                <div class="col-md-4">
                <h4>How does it work?</h4>
                <p>Email is routed through SpamExperts intelligent self-learning servers that will detect and block spam before it ever reaches you.</p>
                <hr>
                <h4>How accurate is the filtering?</h4>
                <p>Thanks to processing millions of emails every day, our email filters have an industry leading rate with close to 100% accuracy.</p>
                <div class="hidden-md hidden-lg"><hr></div>
                </div>
                <div class="col-md-4">
                <h4>Can I recover messages that get blocked?</h4>
                <p>Yes, a comprehensive control panel with log-search, quarantine, and many other tools allows you to check the status of any email which passed through the system.</p>
                <hr>
                <h4>How long does it take to setup?</h4>
                <p>Setup is fast, automated and it will be up and running protecting your email in minutes.</p>
                <div class="hidden-md hidden-lg"><hr></div>
                </div>
                <div class="col-md-4">
                <h4>What is Email Archiving?</h4>
                <p>Email is so important nowadays, with archiving email is securely stored, giving you extra confidence and peace of mind.</p>
                <hr>
                <h4>How much email can I store?</h4>
                <p>Email Archiving includes 10GB of compressed email storage by default. If you need more storage, additional 10GB licenses can be added.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block">
        <div class="container text-center">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/spamexperts/logo.png">
        </div>
    </div>

</div>

<script src="{$WEB_ROOT}/templates/{$template}/store/spamexperts/master.js"></script>
