<div class="content-block standout-features">
    <div class="container">
        <div class="row text-center">
            {if $type == 'ev'}
                <div class="col-sm-4">
                    <h4>Green Address Bar</h4>
                    <p>Activates the green address bar and displays your company or organization name for a prominent visual security indicator.</p>
                </div>
            {elseif $type == 'ov'}
                <div class="col-sm-4">
                    <h4>Organization Validated</h4>
                    <p>With an OV SSL Certificate, the identity of the company or organization that holds the certificate is validated, providing more trust for end users.</p>
                </div>
            {else}
                <div class="col-sm-4">
                    <h4>Delivered in Minutes for Instant Protection</h4>
                    <p>The fastest and most affordable way to activate SSL protection for your website, issuance is quick and often fully automated.</p>
                </div>
            {/if}
            <div class="col-sm-4">
                <h4>Trust Site Seal</h4>
                <p>Our SSL Certificates come with a trust seal that has been proven to increase visitor confidence and customer conversions.</p>
            </div>
            {if $type == 'ev'}
                <div class="col-sm-4">
                    <h4>$1.5m Warranty</h4>
                    <p>EV Certificates come with a $1.5m warranty that covers data breaches caused due to a certificate flaw.</p>
                </div>
            {elseif $type == 'ov'}
                <div class="col-sm-4">
                    <h4>$1.25m Warranty</h4>
                    <p>OV Certificates come with a $1.25m warranty that covers data breaches caused due to a certificate flaw.</p>
                </div>
            {else}
                <div class="col-sm-4">
                    <h4>Boost your Google Ranking</h4>
                    <p>Google uses SSL/HTTPS as a factor in determining search engine ranking. Add SSL today to help boost your Google ranking!</p>
                </div>
            {/if}
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
                    {if $type == 'ev'}
                        <h4>Issued in 2-3 Days</h4>
                    {elseif $type == 'ov'}
                        <h4>Issued in 1-2 Days</h4>
                    {else}
                        <h4>Instant Issuance</h4>
                    {/if}
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
