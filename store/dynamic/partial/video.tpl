<div class="video-section">
    <div class="video-header">
        <h1>{$config->title}</h1>
        <p>{$config->subtitle}</p>
    </div>

    <div class="video-container" {if not $config->isInline}onclick="openVideoPopup()"{/if}>
        <video {if $config->isInline}controls{/if} preload="metadata" class="video-thumbnail">
            <source src="{$config->url}" type="video/mp4">
        </video>
        {if not $config->isInline}
            <div class="play-button"></div>
        {/if}
    </div>
    {if not $config->isInline}
        <!-- Video Popup Modal -->
        <div class="popup-overlay" id="videoPopup">
            <div class="popup-content">
                <button class="close-button" onclick="closeVideoPopup()">&times;</button>
                <video controls src="{$config->url}"
                       class="popup-video"
                       id="popupVideo"></video>
            </div>
        </div>
    {/if}
</div>
