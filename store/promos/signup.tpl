<div class="promo-banner clearfix {$promotion->getClass()}">
    <div class="icon">
        <img src="{$promotion->getImagePath()}">
    </div>

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
        <input type="hidden" name="pid" value="{$product->id}">
        <button type="submit" class="btn btn-success pull-right">
            {$promotion->getCta()}
            {$product->pricing()->best()->breakdownPrice()}
        </button>
    </form>

    {if $promotion->getLearnMoreRoute()}
        <p><a href="{routePath($promotion->getLearnMoreRoute())}">Learn more...</a></p>
    {/if}
</div>
