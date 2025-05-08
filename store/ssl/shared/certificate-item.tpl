<div class="col-md-6 col-lg-4">
    <div class="item">
        <h4>{lang key=$blockTitle}</h4>
        <div class="logo-wrapper">
            <img src="{$WEB_ROOT}/{$logo}">
            <span>{$certificate->name}</span>
        </div>
        <p class="first">{lang key=$description}</p>
        <p class="second"><span>{lang key="store.ssl.landingPage.recommendedFor"}:</span> {lang key=$recommendedFor}</p>
        <ul class="item-features">
            {foreach from=$features item=feature}
                <li>
                    <img src="{$WEB_ROOT}/assets/img/marketconnect/symantec/safety-icon.png">
                    <span>{$feature}</span>
                </li>
            {/foreach}
        </ul>
        <form method="post" action="{routePath('cart-order')}">
            <input type="hidden" name="pid" value="{$certificate->id}">
            <button type="submit" class="btn">{lang key="store.ssl.landingPage.buy"}</button>
        </form>
    </div>
</div>
