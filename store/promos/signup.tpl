<div id="spamExpertsPromo" class="panel panel-default promo-banner {$promotion->getClass()}">
    <div class="panel-body">
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
                {if $promotion->getLearnMoreRoute()}
                    <p><a href="{routePath($promotion->getLearnMoreRoute())}">Learn more...</a></p>
                {/if}
                <form method="post" action="{routePath('store-order')}">
                    <input type="hidden" name="pid" value="{$product->id}">
                    <button type="submit" class="btn btn-success">
                        {$promotion->getCta()} {$product->pricing()->best()->breakdownPrice()}
                    </button>
                </form>

            </div>
        </div>
    </div>
</div>
