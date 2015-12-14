        </div><!-- /.main-content -->
        {if !$inShoppingCart && $secondarySidebar->hasChildren()}
            <div class="col-md-3 pull-md-left sidebar">
                {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
            </div>
        {/if}
    </div>
    <div class="clearfix"></div>
</section>

<section id="footer">

    <p>Copyright &copy; {$date_year} {$companyname}. All Rights Reserved.</p><center><script type="text/javascript" src="https://sealserver.trustwave.com/seal.js?code=67b9e3e7d6c9474da5640164f079a2a5"></script> | <script language="JavaScript" type="text/javascript">
TrustLogo("https://www.spryservers.net/img/comodo_secure_100x85_transp.png", "SC5", "none");
</script>
<a href="https://ssl.comodo.com/ev-ssl-certificates.php" id="comodoTL">EV SSL Certificate</a></center>

</section>

<script src="{$BASE_PATH_JS}/bootstrap.min.js"></script>
<script src="{$BASE_PATH_JS}/jquery-ui.min.js"></script>
<script type="text/javascript">
    var csrfToken = '{$token}';
</script>

<script src="{$WEB_ROOT}/templates/{$template}/js/whmcs.js"></script>

{$footeroutput}

<!-- Piwik -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(["setDoNotTrack", true]);
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//piwik.spryservers.net/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 1]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src="//piwik.spryservers.net/piwik.php?idsite=1" style="border:0;" alt="" /></p></noscript>
<!-- End Piwik Code -->

</body>
</html>
