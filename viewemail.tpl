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
            {if is_array($attachments) && count($attachments) > 0}
                <div class="popup-header-padding">
                    {foreach $attachments as $attachedFile}
                        <i class="fal fa-paperclip"></i> {$attachedFile}{if !$attachedFile@last}<br>{/if}
                    {/foreach}
                </div>
            {/if}
        </div>
        <div class="panel-body main-content">
            <iframe width="100%" height="300" frameborder="0" srcdoc="{$message|escape}"></iframe>
        </div>
        <div class="panel-footer">
            <p class="text-center">
                <input type="button" value="{$LANG.closewindow}" class="btn btn-primary" onclick="window.close()" />
            </p>
        </div>
    </div>
</body>
</html>
