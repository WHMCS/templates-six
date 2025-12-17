<section class="features-table-section {if $elementIndex % 2 == 0}background-light{else}background-main{/if}"
         role="region">
    <div class="features-table-container">
        {if $config->title}
            <h2 class="features-table-title">
                {$config->title}
            </h2>
        {/if}

        {if $config->subtitle}
            <p class="features-table-subtitle">
                {$config->subtitle}
            </p>
        {/if}

        <div class="table-wrapper">
            <table class="comparison-table" role="table" aria-label="Product features comparison">
                <thead>
                <tr>
                    <th class="feature-header" scope="col"></th>
                    {foreach $config->services as $service}
                        {$plan = $products[$service['slug']]}
                        {if !$plan}{continue}{/if}
                        <th class="product-header" scope="col">
                            <h3 class="product-name">{$plan.name}</h3>
                        </th>
                    {/foreach}
                </tr>
                </thead>
                <tbody>
                {$firstPlan = $config->services[0]}
                {foreach $firstPlan['features'] as $featureName => $value}
                    <tr class="feature-row">
                        <td class="feature-name" scope="row">
                            <div class="feature-info">
                                <span class="feature-title">{$featureName}</span>
                            </div>
                        </td>
                        {foreach $config->services as $service}
                            {$plan = $products[$service['slug']]}
                            {if !$plan}{continue}{/if}
                            <td class="feature-value">
                                {$featureValue = $service['features'][$featureName]}
                                {if $featureValue === true}
                                    <span class="feature-check" aria-label="Included">
                                            <i class="fas fa-check" aria-hidden="true"></i>
                                        </span>
                                {elseif $featureValue === false}
                                    <span class="feature-cross" aria-label="Not included">
                                            <i class="fas fa-times" aria-hidden="true"></i>
                                        </span>
                                {elseif is_numeric($featureValue)}
                                    <span class="feature-number">{$featureValue}</span>
                                {else}
                                    <span class="feature-text">{$featureValue}</span>
                                {/if}
                            </td>
                        {/foreach}
                    </tr>
                {/foreach}

                {* Price row *}
                <tr class="price-row">
                    {if $hasPlan}
                        <td class="feature-name">
                            <div class="feature-info">
                                <span class="feature-title">{lang key='store.price'}</span>
                            </div>
                        </td>

                        {foreach $config->services as $service}
                            {$plan = $products[$service['slug']]}
                            {if !$plan}{continue}{/if}
                            <td class="service-price">
                                {if $plan->isFree()}
                                    {lang key="orderpaymenttermfree"}
                                {else}
                                    {$plan->pricing()->first()->toPrefixedString()}
                                {/if}
                            </td>
                        {/foreach}
                    {else}
                        <td class="service-link">
                            <a href="{$WEB_ROOT}/contact.php" class="btn btn-info">
                                {lang key="learnmore"}
                            </a>
                        </td>
                    {/if}
                </tr>

                {* Buy button row *}
                <tr class="buy-row">
                    <td class="feature-name"></td>
                    {foreach $config->services as $service}
                        {$plan = $products[$service['slug']]}
                        {if !$plan}{continue}{/if}
                        <td class="feature-value">
                            <form method="post" action="{routePath('cart-order')}">
                                <input type="hidden" name="checkout" value="1">
                                <input type="hidden" name="pid" value="{$plan->id}">
                                <button class="table-cta-button">{lang key='store.getstarted'}</button>
                            </form>
                        </td>
                    {/foreach}
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
