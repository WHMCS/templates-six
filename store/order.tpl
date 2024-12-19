<div class="container">
    <div class="store-order-container">

        <form method="post" action="{routePath('cart-order-addtocart')}" id="frmAddToCart">
            <input type="hidden" name="pid" value="{$product->id}">
            <input type="hidden" name="domain_type" value="" id="inputDomainType">

            <div class="row">
                <div class="col-sm-7">
                    <h2>{$product->name}</h2>

                    <p>{$product->description}</p>
                </div>
                <div class="col-sm-5">

                    <div class="payment-term">
                        <h4>{lang key='store.choosePaymentTerm'}</h4>
                        <select name="billingcycle" class="form-control">
                            {foreach $product->pricing()->allAvailableCycles() as $pricing}
                                <option value="{$pricing->cycle()}"{if $requestedCycle == $pricing->cycle()} selected{/if}>
                                    {if $pricing->isRecurring()}
                                        {if $pricing->isYearly()}
                                            {$pricing->cycleInYears()} - {$pricing->yearlyPrice()}
                                        {else}
                                            {$pricing->cycleInMonths()} - {$pricing->monthlyPrice()}
                                        {/if}
                                    {else}
                                        {$pricing->toFullString()}
                                    {/if}
                                </option>
                            {/foreach}
                        </select>
                    </div>

                </div>
            </div>

            <br>
            <h4>{lang key='store.chooseDomain'}</h4>

            <ul class="nav nav-tabs store-domain-tabs" role="tablist">
                {if $requireDomain}
                    {if (count($domains) > 0 && $loggedin)}
                        <li role="presentation" class="active"><a href="#existing-domain" aria-controls="existing-domain" role="tab" data-toggle="tab">{lang key='store.chooseExistingDomain'}</a></li>
                    {/if}
                    {if $allowSubdomains}
                        <li role="presentation"><a href="#sub-domain" aria-controls="sub-domain" role="tab" data-toggle="tab">{lang key='store.subOfExisting'}</a></li>
                    {/if}
                    <li role="presentation"><a id="tabCustomDomainControl" href="#custom-domain" aria-controls="custom-domain" role="tab" data-toggle="tab">{lang key='store.domainAlreadyOwned'}</a></li>
                {else}
                    <li role="presentation" class="active">
                        <a id="tabNoDomain" href="#no-domain" role="tab" data-toggle="tab">
                            {lang key='store.noDomain'}
                        </a>
                    </li>
                {/if}
            </ul>
            <div class="tab-content store-domain-tab-content">
                {if $requireDomain}
                    {if count($domains) > 0}
                        <div role="tabpanel" class="tab-pane active" id="existing-domain">
                            {if $loggedin}
                                <div class="row">
                                    <div class="col-sm-8">
                                        <select class="form-control" name="existing_domain">
                                            {foreach $domains as $domain}
                                                <option value="{$domain}"{if $domain == $selectedDomain} selected="selected"{/if}>
                                                    {$domain}
                                                </option>
                                            {/foreach}
                                        </select>
                                    </div>
                                    <div class="col-sm-4">
                                        <span class="domain-validation ok">
                                            <i class="fas fa-check"></i>
                                            {lang key='store.eligible'}
                                        </span>
                                    </div>
                                </div>
                            {else}
                                <a href="{routePath('cart-order-login')}">{lang key='store.login'}</a> {lang key='store.addToExistingPackage'}
                            {/if}
                        </div>
                    {/if}
                    {if $allowSubdomains}
                        <div role="tabpanel" class="tab-pane" id="sub-domain">
                            <div class="row">
                                <div class="col-sm-8">
                                    <div style="display:inline-block;width:47%;">
                                        <input type="text" class="form-control subdomain-input" name="sub_domain" placeholder="Your desired subdomain"></div>
                                    <div style="display:inline-block;width:2%;text-align:center;">
                                        .
                                    </div>
                                    <div style="display:inline-block;width:47%;">
                                        <select class="form-control" name="existing_sld_for_subdomain" id="existing_sld_for_subdomain">
                                            {foreach $domains as $domain}
                                                <option value="{$domain}">{$domain}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <span class="domain-validation subdomain-validation"></span>
                                </div>
                            </div>
                        </div>
                    {/if}
                    <div role="tabpanel" class="tab-pane" id="custom-domain">
                        <div class="row">
                            <div class="col-sm-8">
                                <input type="text" class="form-control domain-input" placeholder="example.com" name="custom_domain" value="{$customDomain}">
                            </div>
                            <div class="col-sm-4">
                                <span class="domain-validation domain-input-validation"></span>
                            </div>
                        </div>
                    </div>
                {else}
                    <div role="tabpanel" class="tab-pane" id="no-domain">
                        {lang key='store.noDomainRequired'}
                    </div>
                {/if}
            </div>
            <div class="row">
                <div class="col-sm-5">
                     <a href="javascript:history.go(-1)" class="btn btn-default">
                        <i class="fas fa-arrow-left"></i>
                        {lang key='back'}
                    </a>
                </div>
                <div class="col-sm-7 text-right">
                    <button type="submit" name="continue" value="1" class="btn btn-default">
                        {lang key='orderForm.continueShopping'}
                    </button>
                    <button type="submit" name="checkout" value="1" class="btn btn-primary">
                        {lang key='orderForm.checkout'}
                        <i class="fas fa-shopping-cart"></i>
                    </button>

                </div>
            </div>

        </form>
    </div>

    {if $upsellProduct && $promotion}
        <div class="store-promoted-product upsell-{$upsellProduct->productKey}">
            <div class="row">
                <div class="col-sm-3">
                    <div class="icon">
                        <img src="{$promotion->getImagePath()}">
                    </div>
                </div>
                <div class="col-sm-9">

                    <h3>{$promotion->getHeadline()}</h3>
                    <h4>{$promotion->getTagline()}</h4>
                    {if $promotion->getDescription()}
                        <p>{$promotion->getDescription()}</p>
                    {/if}
                    {if $promotion->hasFeatures()}
                        <ul class="features">
                            {foreach $promotion->getFeatures() as $highlight}
                                <li><i class="far fa-check-circle"></i> {$highlight}</li>
                            {/foreach}
                        </ul>
                    {/if}
                    <form method="post" action="{routePath('cart-order')}">
                        <input type="hidden" name="pid" value="{$upsellProduct->id}">
                        <input type="hidden" name="upsell" value="1">
                        <button type="submit" class="btn btn-success">
                            {foreach $product->pricing()->allAvailableCycles() as $pricing}
                                <span class="span-upsell span-upsell-{$pricing->cycle()}">
                                    {if is_null($upsellComparison->diff({$pricing->cycle()}))}
                                        {$promotion->getCta()} {$upsellProduct->name} {lang key='store.fromJust'} {$upsellProduct->pricing()->best()->breakdownPrice()}
                                    {else}
                                        {$promotion->getCta()} {$upsellProduct->name} {lang key='store.forJust'} {$upsellComparison->diff({$pricing->cycle()})->breakdownPrice()} {lang key='more'}
                                    {/if}
                                </span>
                            {/foreach}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    {/if}
</div>

<script>
jQuery(document).ready(function(){

    var delay = (function(){
      var timer = 0;
      return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
      };
    })();

    jQuery('.store-order-container .subdomain-input').keyup(function() {
        delay(function(){
          jQuery('.subdomain-validation').html('<i class="fas fa-spinner fa-spin"></i> Validating...').removeClass('ok');

          jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);

          var domainName = jQuery('.subdomain-input').val() + '.' + jQuery('#existing_sld_for_subdomain').val();

          WHMCS.http.jqClient.post('{routePath('cart-order-validate')}', 'domain=' + domainName, function(data) {
              if (data.valid) {
                  jQuery('.subdomain-validation').html('<i class="fas fa-check"></i> Valid').addClass('ok');
                  jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
              } else {
                  jQuery('.subdomain-validation').html('<i class="fas fa-times"></i> Invalid domain');
              }
          }, 'json');

        }, 1000 );
    });

    var delay2 = (function(){
      var timer = 0;
      return function(callback, ms){
        clearTimeout (timer);
        timer = setTimeout(callback, ms);
      };
    })();

    jQuery('.store-order-container .domain-input').keyup(function() {
        delay2(function(){
          jQuery('.domain-input-validation').html('<i class="fas fa-spinner fa-spin"></i> Validating...').removeClass('ok');
          jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
          WHMCS.http.jqClient.post('{routePath('cart-order-validate')}', 'domain=' + jQuery('.domain-input').val(), function(data) {
            if (data.valid) {
                jQuery('.domain-input-validation').html('<i class="fas fa-check"></i> Valid').addClass('ok');
                jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
            } else {
                jQuery('.domain-input-validation').html('<i class="fas fa-times"></i> Invalid domain');
            }
          }, 'json');
        }, 1000 );
    });
    {if $requireDomain}
        jQuery('.store-domain-tabs a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var tab = jQuery(e.target).attr('aria-controls');
            jQuery('#inputDomainType').val(tab);
            if (tab == 'custom-domain' || tab == 'sub-domain') {
                var validationBlockSelector = tab == 'custom-domain' ? '.domain-input-validation' : '.subdomain-validation';
                var validationHtml = jQuery(validationBlockSelector).html();

                if (validationHtml == '<i class="fas fa-check"></i> Valid') {
                    jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                } else {
                    jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
                }
            } else {
                {if $loggedin}
                    jQuery('#frmAddToCart button[type="submit"]').removeProp('disabled');
                {else}
                    jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
                {/if}
            }
        });
    {/if}

    jQuery('.store-domain-tabs li').removeClass('active');
    jQuery('.store-domain-tabs li:first-child a').click();
    {if !$loggedin && $requireDomain}
        jQuery('#frmAddToCart button[type="submit"]').prop('disabled', true);
    {/if}

    jQuery('.payment-term').find('select').change(function() {
        var cycle = jQuery('.payment-term').find('option:selected').val();
        updateUpsellDetailsOnBillingCycleChange(cycle);
    });
    updateUpsellDetailsOnBillingCycleChange(jQuery('.payment-term').find('option:selected').val());

    {if $customDomain}
        jQuery('#tabCustomDomainControl').click();
        jQuery('.store-order-container .domain-input').trigger('keyup');
    {/if}
});

function updateUpsellDetailsOnBillingCycleChange(cycle) {
    jQuery('.span-upsell').hide();
    jQuery('.span-upsell-' + cycle).show();
}
</script>
