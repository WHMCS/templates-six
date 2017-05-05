<div class="promo-banner promo-banner-rounded {$promotion->getClass()}">
    <div class="panel-body">
        <div class="icon-left">
            <a href="{routePath($promotion->getLearnMoreRoute())}">
                <img src="{$promotion->getImagePath()}">
            </a>
        </div>

        <div class="content">

            <h3>
                {$promotion->getHeadline()}
                {if $promotion->getLearnMoreRoute()}
                    <small><a href="{routePath($promotion->getLearnMoreRoute())}">Learn more...</a></small>
                {/if}
            </h3>
            <h4>{$promotion->getTagline()}</h4>

            {if $promotion->getDescription()}
                <p>{$promotion->getDescription()}</p>
            {/if}

            {if $promotion->hasHighlights()}
                <ul>
                    {foreach $promotion->getHighlights() as $highlight}
                        <li><i class="fa fa-check-circle-o"></i> {$highlight}</li>
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

            <form method="post" action="{routePath('store-order')}">
                <input type="hidden" name="pid" value="{$product->id}">
                {if $serviceId}
                    <input type="hidden" name="serviceid" value="{$serviceId}">
                {/if}
                <button type="submit" class="btn btn-success">
                    {$promotion->getCta()} {$product->name} from just {$product->pricing()->best()->breakdownPrice()}
                </button>
            </form>

        </div>

    </div>
</div>
