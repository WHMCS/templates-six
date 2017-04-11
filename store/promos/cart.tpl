<div class="promo-cart clearfix {$promotion->getClass()}">
    <div class="icon">
        <img src="{$promotion->getImagePath()}">
    </div>

    <h3>{$promotion->getHeadline()} <span class="pull-right">{$product->pricing()->first()->breakdownPrice()}</span></h3>
    <h4>{$promotion->getTagline()}</h4>

    {if $promotion->getDescription()}
        <p>
            {$promotion->getDescription()}
            {if $promotion->getLearnMoreRoute()}
                <a href="{routePath($promotion->getLearnMoreRoute())}">Learn more...</a>
            {/if}
        </p>
    {/if}

    <button type="button" class="btn btn-sm btn-add pull-right" data-product-key="{$product->productKey}">
        <span class="loading hidden">
            <i class="fa fa-spinner fa-spin"></i>
        </span>
        <span class="text">
            Add to Cart
        </span>
    </button>

</div>
