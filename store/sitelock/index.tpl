<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page sitelock">

    <div class="hero">
        <div class="container">
            <div class="logo-container">
                <img src="{$WEB_ROOT}/assets/img/marketconnect/sitelock/logo.png">
            </div>
            <h2>{lang key="store.sitelock.tagline"}</h2>
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
            <li><a href="#" onclick="smoothScroll('#plans');return false">Plans & Pricing</a></li>
            <li><a href="#" onclick="smoothScroll('#features');return false">Features</a></li>
            <li><a href="#" onclick="smoothScroll('#emergency');return false">Website Hacked?</a></li>
            <li><a href="#" onclick="smoothScroll('#faq');return false">FAQ</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="content-block">
        <div class="container">

            <h2>Website security &amp; malware protection for your website</h2>

            <br>

            <p>SiteLock&trade;, the global leader in website security, protects your website to give you peace of mind.</p>

            <p>SiteLock's Daily Malware Scanning identifies vulnerabilities and known malicious code and automatically removes it from your website to protect your website and visitors against threats.</p>

            <p>Plus you get the SiteLock Trust Seal which builds customer confidence and is proven to increase sales and conversion rates.</p>

        </div>
    </div>

    <div class="content-block plans" id="plans">
        <div class="container">

            {if !$loggedin && $currencies}
                <form method="post" action="" class="pull-right">
                    <select name="currency" class="form-control currency-selector" onchange="submit()">
                        <option>{lang key="changeCurrency"} ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                        {foreach $currencies as $currency}
                            <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                        {/foreach}
                    </select>
                </form>
            {/if}
            <h2>Compare SiteLock Plans</h2>
            <h3>Professional security features for your website</h3>

            <div class="row plan-comparison">
                {foreach $plans as $plan}
                    <div class="col-lg-{if count($plans) == 4}3{elseif count($plans) == 3}4{elseif count($plans) == 2}6{else}12{/if} col-md-{if count($plans) == 3}4{/if} col-sm-6">
                        <div class="plan">
                            <div class="header">
                                <h4>
                                    {$plan->name}
                                    <span class="pull-right">
                                        {if $plan->isFree()}
                                            FREE
                                        {elseif $plan->pricing()->annually()}
                                            {$plan->pricing()->annually()->toPrefixedString()}
                                        {elseif $plan->pricing()->first()}
                                            {$plan->pricing()->first()->toPrefixedString()}
                                        {else}
                                            -
                                        {/if}
                                    </span>
                                </h4>
                                <p>{$plan->description}</p>
                            </div>
                            <ul>
                                {foreach $plan->features as $label => $value}
                                    <li>
                                        <span>{$label}</span>

                                        {if is_bool($value)}
                                            <i class="fas fa-{if $value}check{else}times{/if}"></i>
                                        {else}
                                            {$value}
                                        {/if}
                                    </li>
                                {/foreach}
                            </ul>
                            <div class="footer">
                                <form method="post" action="{routePath('store-order')}">
                                    <input type="hidden" name="pid" value="{$plan->id}">
                                    <select name="billingcycle" class="form-control">
                                        {foreach $plan->pricing()->allAvailableCycles() as $cycle}
                                            <option value="{$cycle->cycle()}">
                                                {if $cycle->isRecurring()}
                                                    {if $cycle->isYearly()}
                                                        {$cycle->cycleInYears()}
                                                    {else}
                                                        {$cycle->cycleInMonths()}
                                                    {/if}
                                                    -
                                                {/if}
                                                {$cycle->toFullString()}</option>
                                        {/foreach}
                                    </select>
                                    <button type="submit" class="btn btn-block">Buy Now</button>
                                </form>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>

        </div>
    </div>

    <div class="content-block features" id="features">
        <div class="container">

            <h2>SiteLock Features</h2>
            <h3>Provides a range of features designed to protect both your website and your business’ reputation:</h3>

            <br>

            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-search fa-fw"></i>
                        <div class="content">
                            <h4>Malware Scan</h4>
                            <p>Proactively monitors for and alerts you about any malware that is detected on your website.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-wrench fa-fw"></i>
                        <div class="content">
                            <h4>Automatic malware removal</h4>
                            <p>If a scan finds anything, SiteLock will safely remove any known malware automatically.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-code fa-fw"></i>
                        <div class="content">
                            <h4>Vulnerability Scan</h4>
                            <p>Automatically checks your applications to ensure they're up-to-date and secured against known vulnerabilities.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="far fa-file-code fa-fw"></i>
                        <div class="content">
                            <h4>OWASP Protection</h4>
                            <p>Get protection against the top 10 web app security flaws as recognised by OWASP, the Open Web Application Security Project.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-trophy fa-fw"></i>
                        <div class="content">
                            <h4>SiteLock&trade; Trust Seal</h4>
                            <p>Give your visitors added confidence by showing your website is protected by SiteLock.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-shield-alt fa-fw"></i>
                        <div class="content">
                            <h4>Firewall</h4>
                            <p>The TrueShield&trade; Web Application Firewall protects your website against hackers and attacks.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-lock fa-fw"></i>
                        <div class="content">
                            <h4>Protect your reputation</h4>
                            <p>Daily scans help detect malware early before search engines have a chance to find it and blacklist your site.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-star fa-fw"></i>
                        <div class="content">
                            <h4>Fast automated setup</h4>
                            <p>Instant and fully automated setup gives you protection immediately without anything to install.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-globe fa-fw"></i>
                        <div class="content">
                            <h4>Content Delivery Network (CDN)</h4>
                            <p>Speed up your website by distributing it globally and serving it to your visitors from the closest location for faster page load speeds wherever they are.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {if !is_null($emergencyPlan)}
    <div class="content-block emergency" id="emergency">
        <div class="container">

            <h2 class="text-danger">Website Hacked?</h2>
            <h3>Fix it now with SiteLock Emergency Response</h3>

            <p>If your website has been attacked and compromised get immediate emergency assistance to quickly recover your site. Here's how SiteLock Emergency Response helps:</p>

            <br>

            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="far fa-clock fa-fw"></i>
                        <div class="content">
                            <h4>Immediate response</h4>
                            <p>Get our fastest response time with analysis and work to recover your site started within 30 minutes.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-times fa-fw"></i>
                        <div class="content">
                            <h4>Complete malware removal</h4>
                            <p>If our automatic technology is unable to remove the malicious content we'll perform manual cleaning.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-exclamation-circle fa-fw"></i>
                        <div class="content">
                            <h4>Priority treatment</h4>
                            <p>With the emergency package you get fast tracked straight to the top of the queue.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="far fa-calendar-check fa-fw"></i>
                        <div class="content">
                            <h4>7 day aftercare</h4>
                            <p>We'll continue to monitor your site for 7 days to ensure that your site remains malware-free post recovery.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="far fa-envelope fa-fw"></i>
                        <div class="content">
                            <h4>Real-time updates</h4>
                            <p>Track progress with our real-time updates throughout the process of cleaning and recovering your site.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="feature-wrapper">
                        <i class="fas fa-star fa-fw"></i>
                        <div class="content">
                            <h4>One-off payment</h4>
                            <p>The emergency service is available for a single one-off fee, there's no recurring fees or subscription.</p>
                        </div>
                    </div>
                </div>
            </div>

            <br>

            <div class="clearfix">
                <div class="price pull-left">
                    Only {if $emergencyPlan->pricing()->best()}{$emergencyPlan->pricing()->best()->toFullString()}{else}-{/if} for 7 days of protection
                </div>
                <form method="post" action="{routePath('store-order')}">
                    <input type="hidden" name="pid" value="{$emergencyPlan->id}">
                    <button type="submit" class="btn btn-default pull-right">
                        Buy Now
                    </button>
                </form>
            </div>

        </div>
    </div>
    {/if}

    <div class="content-block faq" id="faq">
        <div class="container">

            <h2>Frequently Asked Questions</h2>

            <div aria-multiselectable="true" class="panel-group" id="accordion" role="tablist">
                <div class="panel panel-default">
                    <div class="panel-heading" id="faqOne" role="tab">
                        <h4 class="panel-title"><a aria-controls="collapseOne" aria-expanded="true" data-parent="#accordion" data-toggle="collapse" href="#collapseOne" role="button">What is SiteLock?</a></h4>
                    </div>
                    <div aria-labelledby="faqOne" class="panel-collapse collapse in" id="collapseOne" role="tabpanel">
                        <div class="panel-body">
                            SiteLock provides simple, fast and affordable website security to websites of all sizes. Founded in 2008, the company protects over 12 million websites worldwide. The SiteLock cloud-based suite of products offers automated website vulnerability detection and malware removal, DDoS protection, website acceleration, website risk assessments, and PCI compliance.
                            <br><br>
                            To learn more about SiteLock, <a href="https://vimeo.com/164301190" target="_blank">watch the 'How SiteLock Works' video by clicking here</a>.
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" id="faqTwo" role="tab">
                        <h4 class="panel-title"><a aria-controls="collapseTwo" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseTwo" role="button">What does SiteLock do?</a></h4>
                    </div>
                    <div aria-labelledby="faqTwo" class="panel-collapse collapse" id="collapseTwo" role="tabpanel">
                        <div class="panel-body">
                            SiteLock provides comprehensive website security. It performs website daily scans to identify vulnerabilities or malware. When vulnerabilities or malware are found, you will be alerted immediately. Based on your SiteLock scanner, it will automatically remove any malware on your website.  For content management system (CMS) websites, SiteLock can automatically patch found vulnerabilities.
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" id="faqThree" role="tab">
                        <h4 class="panel-title"><a aria-controls="collapseThree" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseThree" role="button">What types of issues does SiteLock scan for?</a></h4>
                    </div>
                    <div aria-labelledby="faqThree" class="panel-collapse collapse" id="collapseThree" role="tabpanel">
                        <div class="panel-body">
                            SiteLock has the technology to perform a comprehensive website scan that encompasses:
                            <br>
                            <ul>
                                <li><Strong>File-based Malware Scanning and Removal:</Strong> SiteLock performs daily scans of a website's files for malware. If malware is found, the website owner is alerted immediately. SiteLock also offers comprehensive scans to automatically remove the malware.</li>
                                <li><strong>Vulnerability Scanning:</strong> SiteLock performs scans of website applications for common vulnerabilities that could lead to a compromise.</li>
                                <li><strong>Application Security and Vulnerability Patching:</strong> SiteLock has the technology to automatically patch vulnerabilities in content management systems (CMS).</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" id="faqFour" role="tab">
                        <h4 class="panel-title"><a aria-controls="collapseFour" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseFour" role="button">What are vulnerabilities and malware?</a></h4>
                    </div>
                    <div aria-labelledby="faqFour" class="panel-collapse collapse" id="collapseFour" role="tabpanel">
                        <div class="panel-body">
                            A <strong>website vulnerability</strong> is a weakness or misconfiguration in a website or web application code that allows an attacker to gain some level of control of the site, and possibly the hosting server. Most vulnerabilities are exploited through automated means, such as vulnerability scanners and botnets.
                            <br><br>
                            <strong>Malware</strong>, short for malicious software, is used to gather sensitive data, gain unauthorized access to websites and even hijack computers.
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" id="faqFive" role="tab">
                        <h4 class="panel-title"><a aria-controls="collapseFive" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseFive" role="button">Will SiteLock impact website performance?</a></h4>
                    </div>
                    <div aria-labelledby="faqFive" class="panel-collapse collapse" id="collapseFive" role="tabpanel">
                        <div class="panel-body">
                            No. During a website scan, SiteLock downloads the relevant files to a secure server and performs scans there. There is no impact to the website content, code, bandwidth or server resources on the website.
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" id="faqSix" role="tab">
                        <h4 class="panel-title"><a aria-controls="collapseSix" aria-expanded="false" class="collapsed" data-parent="#accordion" data-toggle="collapse" href="#collapseSix" role="button">What is the SiteLock Trust Seal?</a></h4>
                    </div>
                    <div aria-labelledby="faqSix" class="panel-collapse collapse" id="collapseSix" role="tabpanel">
                        <div class="panel-body">
                            The SiteLock Trust Seal is a widely-recognized security badge you can display on your website. It is a clear indication that your website is secure and malware-free. To add the seal to your website, simply include the code snippet that SiteLock provides in the footer area of your website.
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="content-block">
        <div class="container text-center">
            <img src="{$WEB_ROOT}/assets/img/marketconnect/sitelock/logo.png">
        </div>
    </div>

</div>
