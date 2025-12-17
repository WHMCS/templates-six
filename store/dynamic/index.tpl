<link href="{assetPath file='store.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath ns='store/dynamic/assets' file='dynamic-store.css'}?v={$versionHash}" rel="stylesheet">

<div class="dynamic-landing-page"
     style="
             --primary-color: {$pageData->branding->primaryColor};
             --secondary-color: {$pageData->branding->secondaryColor};
             --accent-color: {$pageData->branding->accentColor};
             --text-color: {$pageData->branding->textColor};
             --text-secondary: {$pageData->branding->textColorSecondary};
             --bg-color: {$pageData->branding->backgroundColor};
             --bg-light: {$pageData->branding->componentBgLight};
             --bg-dark: {$pageData->branding->componentBgDark};
             font-family: {$storeConfig->typography->p};
             ">
    {foreach $pageData->blocks->items as $brandingBlock}
        {$blockType = $brandingBlock->getBlockType()}
        {$blockLink = "$template/store/dynamic/partial/$blockType.tpl"}

        {include file=$blockLink
            config=$brandingBlock
            products=$products
            hasPlan=$blockHasPlan[$brandingBlock@iteration]
            elementIndex=$brandingBlock@iteration}
    {/foreach}
</div>
<script src="{assetPath ns='store/dynamic/assets' file='dynamic-store.js'}?v={$versionHash}"></script>
