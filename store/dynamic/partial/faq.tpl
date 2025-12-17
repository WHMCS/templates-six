<section class="faq-section {if $elementIndex % 2 == 0}background-light{else}background-main{/if}" role="region">
    <div class="faq-container">
        {if $config->title}
            <h2 class="faq-title">
                {$config->title}
            </h2>
        {/if}

        {if $config->subtitle}
            <p class="faq-subtitle">
                {$config->subtitle}
            </p>
        {/if}

        {if $config->items}
            <div class="faq-accordion">
                {foreach from=$config->items item=faq name=faqs}
                    <div class="faq-item" data-faq-index="{$smarty.foreach.faqs.index}">
                        <input type="checkbox"
                               id="faq-{$smarty.foreach.faqs.index}"
                               class="faq-toggle"
                               {if $smarty.foreach.faqs.first}checked{/if}>

                        <label for="faq-{$smarty.foreach.faqs.index}"
                               class="faq-question"
                               role="button"
                               aria-expanded="{if $smarty.foreach.faqs.first}true{else}false{/if}"
                               tabindex="0">
                            <span class="faq-question-text">{$faq->question}</span>
                            <span class="faq-icon" aria-hidden="true">
                                <i class="fas fa-plus faq-icon-plus"></i>
                                <i class="fas fa-minus faq-icon-minus"></i>
                            </span>
                        </label>

                        <div class="faq-answer" role="region" aria-labelledby="faq-{$smarty.foreach.faqs.index}">
                            <div class="faq-answer-content">
                                {$faq->answer}
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}
    </div>
</section>
