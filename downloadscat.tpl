<form role="form" method="post" action="downloads.php?action=search">
    <div class="input-group margin-bottom">
        <input type="text" name="search" class="form-control" placeholder="{$LANG.downloadssearch}" value="{$search}" />
        <span class="input-group-btn">
            <input type="submit" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
        </span>
    </div>
</form>

<p>{$LANG.downloadsintrotext}</p>

<div class="row">
    {if $dlcats}
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-star"></i>&nbsp;{$LANG.downloadscategories}</h3>
                </div>
                <div class="list-group">
                    {foreach from=$dlcats item=dlcat}
                        <span class="list-group-item">
                            <a href="{if $seofriendlyurls}{$WEB_ROOT}/downloads/{$dlcat.id}/{$dlcat.urlfriendlyname}{else}downloads.php?action=displaycat&amp;catid={$dlcat.id}{/if}"><i class="fa fa-folder-open-o"></i>&nbsp;<strong>{$dlcat.name}</strong></a> ({$dlcat.numarticles})<br />
                            {$dlcat.description}
                        </span>
                    {/foreach}
                </div>
            </div>
        </div>
    {/if}

    <div class="col-md-{if $dlcats}6{else}12{/if}">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-folder-open"></i>&nbsp;{$LANG.downloadsfiles}</h3>
            </div>
            <div class="list-group">
                {if $downloads}
                    {foreach from=$downloads item=download}
                        <div class="list-group-item">
                            <a href="{$download.link}">
                                <i class="fa fa-file-o"></i>
                                <strong>
                                    {$download.title}
                                    {if $download.clientsonly}
                                        <i class="fa fa-lock"></i>
                                    {/if}
                                </strong>
                            </a><br />
                            {$download.description}
                        <div><span class="text-muted">{$LANG.downloadsfilesize}: {$download.filesize}</span></div>
                        </div>
                    {/foreach}
                {else}
                    <div class="list-group-item"><p class="text-center">{$LANG.downloadsnone}</p></div>
                {/if}
            </div>
        </div>
    </div>
</div>
