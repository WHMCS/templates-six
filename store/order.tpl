<div class="container">
    <div class="store-order-container">

        <form method="post" action="{routePath('store-order-addtocart')}">
            <input type="hidden" name="pid" value="{$product->id}">

            <div class="payment-term">
                <h4>Choose Payment Term</h4>
                <select name="billingcycle" class="form-control">
                    {foreach $product->pricing()->allAvailableCycles() as $pricing}
                        <option value="{$pricing->cycle()}">
                            {if $pricing->isYearly()}
                                {$pricing->cycleInYears()} - {$pricing->yearlyPrice()}
                            {else}
                                {$pricing->cycleInMonths()} - {$pricing->monthlyPrice()}
                            {/if}
                        </option>
                    {/foreach}
                </select>
            </div>

            {if !$loggedin}
                <div class="pull-right text-right">
                    Looking to add this to an existing domain?<br>
                    <a href="#">Login now</a>
                </div>
            {/if}

            <h2>{$product->name}</h2>

            <p>{$product->description}</p>

            <br>

            <h4>Choose Domain</h4>

            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Choose Existing Domain</a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Subdomain of an Existing Domain</a></li>
                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">A domain I already own</a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <div class="row">
                        <div class="col-sm-8">
                            <select class="form-control" name="existing_domain">
                                {foreach $domains as $domain}
                                    <option value="{$domain}">{$domain}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="col-sm-4">
                            <span class="domain-validation ok">
                                <i class="fa fa-check"></i>
                                Elligible
                            </span>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile">
                    <div class="row">
                        <div class="col-sm-8">
                            <div style="display:inline-block;width:47%;">
                                <input type="text" class="form-control subdomain-input" placeholder="Your desired subdomain"></div>
                            <div style="display:inline-block;width:2%;text-align:center;">
                                .
                            </div>
                            <div style="display:inline-block;width:47%;">
                                <select class="form-control">
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
                <div role="tabpanel" class="tab-pane" id="messages">
                    <div class="row">
                        <div class="col-sm-8">
                            <input type="text" class="form-control domain-input" placeholder="yourdomain.com">
                        </div>
                        <div class="col-sm-4">
                            <span class="domain-validation domain-input-validation"></span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-5">
                     <a href="javascript:history.go(-1)" class="btn btn-default">
                        <i class="fa fa-arrow-left"></i>
                        Back
                    </a>
                </div>
                <div class="col-sm-7 text-right">
                    <button type="submit" name="continue" value="1" class="btn btn-default">
                        Continue Shopping
                    </button>
                    <button type="submit" name="checkout" value="1" class="btn btn-primary">
                        Checkout
                        <i class="fa fa-shopping-cart"></i>
                    </button>

                </div>
            </div>

        </form>
    </div>

    {if $upsellProduct && $promotion}

<div class="store-promoted-product">
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
            <ul>
                {foreach $promotion->getHighlights() as $highlight}
                    <li>{$highlight}</li>
                {/foreach}
            </ul>
            <form method="post" action="{routePath('store-order')}">
                <input type="hidden" name="pid" value="{$upsellProduct->id}">
                <button type="submit" class="btn btn-success">
                    {$promotion->getCta()} {$upsellProduct->pricing()->best()->breakdownPrice()}
                </button>
            </form>

        </div>
    </div>
</div>

<style>
.store-promoted-product {
    margin: 50px 0;
    padding: 30px 30px 50px 30px;
    background-color: #f6f6f6;
}
.store-promoted-product .icon {
    height: 200px;
    line-height: 200px;
    text-align: center;
    overflow: hidden;
}
.store-promoted-product .icon img {
    max-width: 100%;
    max-height: 100%;
}
.store-promoted-product .btn {
    padding: 10px 30px;
    font-size: 1.2em;
    font-weight: 300;
}
</style>


    {/if}
</div>




<style>
.store-order-container {
    margin: 20px 0;
    padding: 30px;
}
.store-order-container h2 {
    margin-top: 0;
}
.store-order-container .btn {
    padding: 10px 30px;
    font-size: 1.15em;
    font-weight: 300;
}

.store-order-container .nav-tabs {
    margin-top: 20px;
}
.store-order-container .nav-tabs li a {
    margin-right: 10px;
    padding: 7px 15px;
    background-color: #f9f9f9;
    border-bottom: 1px solid #ddd;
}
.store-order-container .nav-tabs li.active a {
    background-color: #fff;
    border-bottom: 1px solid transparent;
}
.store-order-container .tab-content {
    margin-bottom: 20px;
    padding: 20px;
    border: 1px solid #ddd;
    border-top: 0;
}

.store-order-container .payment-term {
    float: right;
    margin-left: 200px;
}
.store-order-container .payment-term h4 {
    margin-top: 0;
}

.store-order-container .domain-validation {
    display: block;
    padding-top: 5px;
    font-size: 1.2em;
    font-weight: 300;
}
.store-order-container .domain-validation.ok {
    color: #53a22d;
}
</style>

<script>
jQuery(document).ready(function(){

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

$('.subdomain-input').keyup(function() {
    delay(function(){
      $('.subdomain-validation').html('<i class="fa fa-spinner fa-spin"></i> Validating...');
    }, 1000 );
});

var delay2 = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

$('.domain-input').keyup(function() {
    delay2(function(){
      $('.domain-input-validation').html('<i class="fa fa-spinner fa-spin"></i> Validating...');
    }, 1000 );
});

});

</script>
