<link href="{$WEB_ROOT}/templates/six/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.wildcard.title"}</h2>
            <h3>{lang key="store.ssl.wildcard.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="wildcard"}

    <div class="content-block">
        <div class="container">

            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl-subs.png" class="right-icon"><h3>

            {lang key="store.ssl.wildcard.descriptionTitle"}</h3>

            {lang key="store.ssl.wildcard.descriptionContent"}

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="wildcard"}

    {include file="$template/store/ssl/shared/features.tpl" type="wildcard"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
