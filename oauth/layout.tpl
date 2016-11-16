<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="{$charset}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$requestedAction} - {$companyname}</title>

    <link href="{$WEB_ROOT}/templates/{$template}/css/all.min.css" rel="stylesheet">
    <link href="{$WEB_ROOT}/templates/{$template}/css/custom.css" rel="stylesheet" >
    <link href="{$WEB_ROOT}/templates/{$template}/oauth/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>

    <section id="header">
        <div class="container">
            <img src="{$logo}" />
            <div class="pull-right text-right">
                {if $loggedin}
                    <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmLogout">
                        <input type="hidden" name="logout" value="1"/>
                        <input type="hidden" name="request_hash" value="{$request_hash}"/>
                        <p>
                            {lang key='oauth.currentlyLoggedInAs' firstName=$loggedinuser.firstname lastName=$loggedinuser.lastname}.
                            <a href="#" onclick="jQuery('#frmLogout').submit()">{lang key='oauth.notYou'}</a>
                        </p>
                    </form>
                {/if}
                <form method="post" action="{$issuerurl}oauth/authorize.php" id="frmCancelLogin">
                    <input type="hidden" name="return_to_app" value="1"/>
                    <input type="hidden" name="request_hash" value="{$request_hash}"/>
                    <button type="submit" class="btn btn-default">
                        {lang key='oauth.returnToApp' appName=$appName}
                    </button>
                </form>
            </div>
        </div>
    </section>

    <section id="content">
        {$content}
    </section>

    <section id="footer">
        {lang key='oauth.copyrightFooter' dateYear=$date_year companyName=$companyname}
    </section>

    <script src="{$WEB_ROOT}/templates/{$template}/js/scripts.min.js"></script>
  </body>
</html>
