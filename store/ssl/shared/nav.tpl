<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-ssl" aria-expanded="false">
        <span class="sr-only">{lang key='toggleNav'}</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="nav-ssl">
      <ul class="nav navbar-nav">
          <li {if empty($current)} class="active"{/if}><a href="{routePath('store-product-group', $routePathSlug)}">{lang key='overview'}</a></li>
          {if $certTypes.dv > 0 || $inPreview}
              <li{if $current == 'dv'} class="active"{/if}><a href="{routePath('store-product-group', $routePathSlug, 'dv')}">{lang key='store.ssl.shared.dvSsl'}</a></li>
          {/if}
          {if $certTypes.ov > 0 || $inPreview}
              <li{if $current == 'ov'} class="active"{/if}><a href="{routePath('store-product-group', $routePathSlug, 'ov')}">{lang key='store.ssl.shared.ovSsl'}</a></li>
          {/if}
          {if $certTypes.ev > 0 || $inPreview}
              <li{if $current == 'ev'} class="active"{/if}><a href="{routePath('store-product-group', $routePathSlug, 'ev')}">{lang key='store.ssl.shared.evSsl'}</a></li>
          {/if}
          {if $certTypes.wildcard > 0 || $inPreview}
            <li{if $current == 'wildcard'} class="active"{/if}><a href="{routePath('store-product-group', $routePathSlug, 'wildcard')}">{lang key='store.ssl.shared.wildcardSsl'}</a></li>
          {/if}
      </ul>
    </div>
  </div>
</nav>

{if $inCompetitiveUpgrade}
    <div class="competitive-upgrade-banner" id="competitiveUpgradeBanner">
        <div class="container">
            <button class="btn btn-default btn-sm pull-right" onclick="$('#competitiveUpgradeBanner').slideUp()">{lang key="dismiss"}</button>
            <h4>{lang key="store.ssl.competitiveUpgrade"}</h4>
            <p>{lang key="store.ssl.competitiveUpgradeBannerMsg" domain=$competitiveUpgradeDomain}</p>
        </div>
    </div>
{/if}
