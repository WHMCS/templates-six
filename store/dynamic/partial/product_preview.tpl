<section
        class="product-showcase {if $config->imageAlignment == 'left'}product-showcase--reverse{/if} {if $elementIndex % 2 == 0}background-light{else}background-main{/if}"
        role="region"
>
    <div class="showcase-container">
        <div class="showcase-content">
            {if $config->title}
                <h2 class="showcase-title">
                    {$config->title}
                </h2>
            {/if}

            {if $config->subtitle}
                <p class="showcase-subtitle">
                    {$config->subtitle}
                </p>
            {/if}

            {if $config->description}
                <div class="showcase-description">
                    {$config->description}
                </div>
            {/if}
        </div>
        <div class="showcase-media">
            <div class="showcase-image">
                <img src="{$config->previewImage}"
                     alt="{$config->title}"
                     loading="lazy">
            </div>
        </div>
    </div>
</section>
