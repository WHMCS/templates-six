<!-- Bootstrap -->
<link href="{$BASE_PATH_CSS}/bootstrap.min.css" rel="stylesheet">
<link href="{$BASE_PATH_CSS}/font-awesome.min.css" rel="stylesheet">

<!-- Styling -->
<link href="{$WEB_ROOT}/templates/{$template}/css/overrides.css" rel="stylesheet">
<link href="{$WEB_ROOT}/templates/{$template}/css/styles.css" rel="stylesheet">

<!-- jQuery -->
<script src="{$BASE_PATH_JS}/jquery.min.js"></script>

<!-- RTL Support -->
{if $language eq "hebrew" || $language eq "Hebrew" || $language eq "arabic" || $language eq "Arabic"}
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/rtl.css">
{/if}

<!-- Custom Styling -->
<link rel="stylesheet" href="{$WEB_ROOT}/templates/{$template}/css/custom.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
