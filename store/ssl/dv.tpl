<link href="{$WEB_ROOT}/templates/six/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key="store.ssl.dv.title"}</h2>
            <h3>{lang key="store.ssl.dv.tagline"}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="dv"}

    <div class="content-block">
        <div class="container">

            <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/ssl.png" class="right-icon">

            <h3>{lang key="store.ssl.dv.descriptionTitle"}</h3>

            {lang key="store.ssl.dv.descriptionContent"}

        </div>
    </div>

    {include file="$template/store/ssl/shared/certificate-pricing.tpl" type="dv"}

    {include file="$template/store/ssl/shared/features.tpl" type="dv"}

    {include file="$template/store/ssl/shared/logos.tpl"}

</div>
