<!-- Bootstrap -->
<link href="{$BASE_PATH_CSS}/bootstrap.min.css" rel="stylesheet">
<link href="{$BASE_PATH_CSS}/font-awesome.min.css" rel="stylesheet">

<!-- Styling -->
<link href="{$WEB_ROOT}/templates/{$template}/css/overrides.css" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/css/styles.css" rel="stylesheet">

<!-- jQuery -->
<script src="{$BASE_PATH_JS}/jquery.min.js"></script>

<!-- Custom Styling -->
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/custom.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

{if !empty($loadMarkdownEditor)}
    <!-- Markdown Editor -->
    <link href="{$BASE_PATH_CSS}/bootstrap-markdown.min.css" rel="stylesheet" />
    <script src="{$BASE_PATH_JS}/bootstrap-markdown.js"></script>
    <script src="{$BASE_PATH_JS}/markdown.min.js"></script>
    <script src="{$BASE_PATH_JS}/to-markdown.js"></script>
    {if !empty($mdeLocale)}
        {$mdeLocale}
    {/if}
{/if}

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
