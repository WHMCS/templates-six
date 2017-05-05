<div class="promo-banner promo-cart clearfix {$promotion->getClass()}">

    <h3>{$promotion->getHeadline()}</h3>

    <div class="icon-left">
        <img src="{$promotion->getImagePath()}">
    </div>

    <div class="content">

        <h4>{$promotion->getTagline()}</h4>

        {if $promotion->getDescription()}
            <p>
                {$promotion->getDescription()}
            </p>
        {/if}

        {if $promotion->hasHighlights()}
            <ul>
                {foreach $promotion->getHighlights() as $highlight}
                    <li>{$highlight}</li>
                {/foreach}
            </ul>
        {/if}

        {if $promotion->hasFeatures()}
            <ul>
                {foreach $promotion->getFeatures() as $feature}
                    <li><i class="fa fa-check-circle-o"></i> {$feature}</li>
                {/foreach}
            </ul>
        {/if}

        {if $promotion->getLearnMoreRoute()}
            <p class="learn-more">
                <a href="{routePath($promotion->getLearnMoreRoute())}">Learn more...</a>
            </p>
        {/if}

        <div class="pricing">
            <h3>{$product->pricing()->first()->breakdownPrice()}</h3>

            <button type="button" class="btn btn-sm btn-add" data-product-key="{$product->productKey}">
                <span class="loading hidden">
                    <i class="fa fa-spinner fa-spin"></i>
                </span>
                <span class="text">
                    Add to Cart
                </span>
            </button>
        </div>

    </div>

</div>
