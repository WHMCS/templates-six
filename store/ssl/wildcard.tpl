<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.wildcard.title"}</h2>
            <h3>{lang key="store.ssl.wildcard.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="wildcard"}

    <div class="content-block standout">
        <div class="container">

            <div class="row">
                <div class="col-sm-4 col-md-3 col-sm-push-8 col-md-push-9 text-right hidden-xs">
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png">
                </div>
                <div class="col-sm-8 col-md-9 col-sm-pull-4 col-md-pull-3">

                    <h3>{lang key="store.ssl.wildcard.descriptionTitle"}</h3>

                    <div class="text-center visible-xs">
                        <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png">
                        <br><br>
                    </div>

                    {lang key="store.ssl.wildcard.descriptionContent"}

                </div>
            </div>

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="wildcard"}

    {include file="$template/store/ssl/shared/features.tpl" type="wildcard"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
