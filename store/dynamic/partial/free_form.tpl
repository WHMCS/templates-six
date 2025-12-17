<section class="features-section {if $elementIndex % 2 == 0}background-light{else}background-main{/if}" role="region">
    <div class="features-container">
        {if $config->title}
            <h2 class="features-title">
                {$config->title}
            </h2>
        {/if}

        {if $config->subtitle}
            <p class="features-subtitle">
                {$config->subtitle}
            </p>
        {/if}

        {if $config->content}
            <div class="features-content">
                {$config->content}
            </div>
        {/if}
    </div>
</section>