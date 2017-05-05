<div class="promo-banner promo-banner-rounded promo-banner-slim {$promotion->getClass()}">
    <div class="panel-body">
        <div class="icon-left">
            <a href="{routePath($promotion->getLearnMoreRoute())}">
                <img src="{$promotion->getImagePath()}">
            </a>
        </div>

        <div class="content">

            <h3>
                {$promotion->getHeadline()}
            </h3>
            <h4>
                {$promotion->getTagline()}
            </h4>

            <form method="post" action="{routePath('store-order')}">
                <input type="hidden" name="pid" value="{$product->id}">
                {if $serviceId}
                    <input type="hidden" name="serviceid" value="{$serviceId}">
                {/if}
                <button type="submit" class="btn btn-success">
                    {$promotion->getCta()} {$product->name} from just {$product->pricing()->best()->breakdownPrice()}
                </button>

            {if $promotion->getLearnMoreRoute()}
                <a href="{routePath($promotion->getLearnMoreRoute())}">Learn more...</a>
            {/if}
            </form>

        </div>

    </div>
</div>
