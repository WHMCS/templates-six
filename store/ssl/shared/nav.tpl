<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-ssl" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="nav-ssl">
      <ul class="nav navbar-nav">
        {if count($certificates.dv) > 0 || $inPreview}
            <li{if $current == 'dv'} class="active"{/if}><a href="{routePath('store-ssl-certificates-dv')}">Standard SSL (DV)</a></li>
        {/if}
        {if count($certificates.ov) > 0 || $inPreview}
            <li{if $current == 'ov'} class="active"{/if}><a href="{routePath('store-ssl-certificates-ov')}">Organisation Validation (OV)</a></li>
        {/if}
        {if count($certificates.ev) > 0 || $inPreview}
            <li{if $current == 'ev'} class="active"{/if}><a href="{routePath('store-ssl-certificates-ev')}">Extended Validation (EV)</a></li>
        {/if}
        {if count($certificates.wildcard) > 0 || $inPreview}
            <li{if $current == 'wildcard'} class="active"{/if}><a href="{routePath('store-ssl-certificates-wildcard')}">Wildcard</a></li>
        {/if}
      </ul>
    </div>
  </div>
</nav>
