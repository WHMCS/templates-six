<link href="{$WEB_ROOT}/templates/six/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>Wildcard SSL</h2>
            <h3>Secure unlimited subdomains on a single certificate.</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="wildcard"}

    <div class="content-block">
        <div class="container">

            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png" class="right-icon">

            <h3>What is a Wildcard SSL Certificate?</h3>

            <p>Wildcard SSL allows you to secure an unlimited number of subdomains on a single certificate. It’s a great solution for anyone who hosts or manages multiple sites or pages that exist on the same domain. The one-time cost of the certificate covers you for additional subdomains you may add in the future.</p>

            <p>Unlike a standard SSL Certificate that is issued to a single Fully Qualified Domain Name only, e.g. www.yourdomain.com, which means it can only be used to secure the exact domain to which it has been issued, a Wildcard SSL Certificate is issued to *.yourdomain.com, where the asterisk represents all possible subdomains.</p>

            <p>Wildcard SSL is an option available for DV and OV SSL Certificates.</p>

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="wildcard"}

    <div class="content-block">
        <div class="container">
            <div class="row text-center">
                <div class="col-sm-4">
                    <h4>Delivered in Minutes for Instant Protection</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vehicula urna nec risus posuere, sed auctor turpis scelerisque.</p>
                </div>
                <div class="col-sm-4">
                    <h4>Boost your Google Ranking</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vehicula urna nec risus posuere, sed auctor turpis scelerisque.</p>
                </div>
                <div class="col-sm-4">
                    <h4>Increase Customer Conversions by Displaying a Site Seal</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vehicula urna nec risus posuere, sed auctor turpis scelerisque.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="content-block features">
        <div class="container">
            <h3>Certificate Features</h3>
            <div class="row">
                <div class="col-sm-4">
                    <div class="feature">
                        <i class="fa fa-certificate"></i>
                        <h4>Strongest & Fastest SSL</h4>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="feature">
                        <i class="fa fa-window-maximize"></i>
                        <h4>99.9% Browser Compatability</h4>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="feature">
                        <i class="fa fa-trophy"></i>
                        <h4>Market Leading Security</h4>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="feature">
                        <i class="fa fa-lock"></i>
                        <h4>Recognised & Trusted Brand</h4>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="feature">
                        <i class="fa fa-clock-o"></i>
                        <h4>Instant Issuance</h4>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="feature">
                        <i class="fa fa-refresh"></i>
                        <h4>Free Reissues</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
