<div class="promo-banner promo-banner-rounded {$promotion->getClass()}">
    <div class="panel-body">
        <div class="icon-left">
            <a href="{$promotion->getLearnMoreRoute()}">
                <img src="{$promotion->getImagePath()}">
            </a>
        </div>

        <div class="content">

            <h3>
                {$promotion->getHeadline()}
                {if $promotion->getLearnMoreRoute()}
                    <small><a href="{$promotion->getLearnMoreRoute()}">{lang key='learnmore'}...</a></small>
                {/if}
            </h3>
            <h4>{$promotion->getTagline()}</h4>

            {if $promotion->getDescription()}
                <p>{$promotion->getDescription()}</p>
            {/if}

            {if $promotion->hasFeatures()}
                <ul>
                    {foreach $promotion->getFeatures() as $feature}
                        <li><i class="far fa-check-circle"></i> {$feature}</li>
                    {/foreach}
                </ul>
            {/if}

            <form method="post" action="{$targetUrl}">
                {foreach $inputParameters as $key => $value}
                    <input type="hidden" name="{$key}" value="{$value}">
                {/foreach}
                <button type="submit" class="btn btn-success">
                    {if $product->isFree()}
                        {$promotion->getCta()}
                        {lang key="orderfree"}
                    {else}
                        {$promotion->getCta()} {$product->name}
                        {lang key="fromJust"}
                        {if $product->pricing()->first()->isYearly()}
                            {$product->pricing()->first()->yearlyPrice()}
                        {elseif $product->pricing()->first()->isOneTime()}
                            {$product->pricing()->first()->oneTimePrice()}
                        {else}
                            {$product->pricing()->first()->monthlyPrice()}
                        {/if}
                    {/if}
                </button>
            </form>

        </div>

    </div>
</div>
