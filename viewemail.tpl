<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{$LANG.clientareaemails} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

</head>
<body id="popup-backdrop">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h2 class="popup-header-padding"><i class='far fa-envelope'>&nbsp;</i>{$subject}</h2>
        </div>
        <div class="panel-body main-content">
            {$message}
        </div>
        <div class="panel-footer">
            <p class="text-center">
                <input type="button" value="{$LANG.closewindow}" class="btn btn-primary" onclick="window.close()" />
            </p>
        </div>
    </div>
</body>
</html>
