<section class="hero-section {if $elementIndex % 2 == 0}background-light{else}background-main{/if}" role="banner">
    <div class="hero-content">
        <div class="hero-brand">
            {if $config->logo}
                <div class="hero-logo-container">
                    <img src="{$config->logo}"
                         alt="{$config->title|default:'Brand'}"
                         class="hero-logo-image"
                         loading="lazy"
                    >
                </div>
            {/if}
            <div class="hero-text">
                {if $config->title}
                    <h1 class="hero-title" id="hero-title-{$smarty.foreach.blocks.index}">
                        {$config->title}
                    </h1>
                {/if}
                {if $config->subtitle}
                    <p class="hero-subtitle">
                        {$config->subtitle}
                    </p>
                {/if}
                {if $config->shortDescription}
                    <p class="hero-description">
                        {$config->shortDescription}
                    </p>
                {/if}
            </div>
        </div>
        <div class="hero-accent"></div>
    </div>
</section>

