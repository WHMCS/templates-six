<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.ev.title"}</h2>
            <h3>{lang key="store.ssl.ev.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="ev"}

    <div class="content-block">
        <div class="container">

            <div class="row">
                <div class="col-sm-4 col-sm-push-8 text-right hidden-xs">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-multi.png">
                </div>
                <div class="col-sm-8 col-sm-pull-4">

                    <h3>{lang key="store.ssl.ev.descriptionTitle"}</h3>

                    <div class="text-center visible-xs">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-multi.png">
                        <br><br>
                    </div>

                    {lang key="store.ssl.ev.descriptionContent"}

                </div>
            </div>

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="ev"}

    <div class="content-block dashed-border">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-lg-push-7 col-md-5 col-md-push-7">
                    <br>
                    <h4>Contains Your EV Authenticated Organization Details</h4>
                    <p>Certificate details indicate your website is using an Extended Validation SSL Certificate and include the issuing CA, validity status, and expiration date.</p>
                </div>
                <div class="col-lg-6 col-lg-pull-2 col-md-7 col-md-pull-4">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/cert-details-ev.png">
                </div>
            </div>
        </div>
    </div>

    {include file="$template/store/ssl/shared/features.tpl" type="ev"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
