<link href="{$WEB_ROOT}/templates/{$template}/css/all.min.css?v={$versionHash}" rel="stylesheet">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
<link rel='stylesheet' id='cloudme-fonts-css'  href='https://fonts.googleapis.com/css?family=Lato%3A300%2C400%2C700%2C900&#038;subset=latin%2Clatin-ext&#038;ver=1.0.0' type='text/css' media='all' />

<link rel='stylesheet' id='cloudme-bootstrap-css'  href='{$WEB_ROOT}/templates/{$template}/cloudme/css/bootstrap.css?ver=4.9.6' type='text/css' media='all' />
<link rel='stylesheet' id='cloudme-slicknav-css'  href='{$WEB_ROOT}/templates/{$template}/cloudme/css/slicknav.css?ver=4.9.6' type='text/css' media='all' />
<link rel='stylesheet' id='cloudme-morphext-css'  href='{$WEB_ROOT}/templates/{$template}/cloudme/css/morphext.css?ver=4.9.6' type='text/css' media='all' />
<link rel='stylesheet' id='cloudme-normalize-css'  href='{$WEB_ROOT}/templates/{$template}/cloudme/css/normalize.css?ver=4.9.6' type='text/css' media='all' />
<link rel='stylesheet' id='cloudme-font-awesome-css'  href='{$WEB_ROOT}/templates/{$template}/cloudme/css/font-awesome.min.css?ver=4.9.6' type='text/css' media='all' />
<link rel='stylesheet' id='cloudme-style-css'  href='{$WEB_ROOT}/templates/{$template}/cloudme/style.css?ver=21-05-2015' type='text/css' media='all' />


<link href="{$WEB_ROOT}/templates/{$template}/css/custom.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    var csrfToken = '{$token}',
        markdownGuide = '{lang key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang key="markdown.saved"}',
        saving = '{lang key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
<script src="{$WEB_ROOT}/templates/{$template}/js/scripts.min.js?v={$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
