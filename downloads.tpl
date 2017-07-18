{if empty($dlcats) }
    {include file="$template/includes/alert.tpl" type="info" msg=$LANG.downloadsnone textcenter=true}
{else}
    <form role="form" method="post" action="{routePath('download-search')}">
        <div class="input-group input-group-lg kb-search margin-bottom">
            <input type="text" name="search" id="inputDownloadsSearch" class="form-control" placeholder="{$LANG.downloadssearch}" />
            <span class="input-group-btn">
                <input type="submit" id="btnDownloadsSearch" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
            </span>
        </div>
    </form>

    <p>{$LANG.downloadsintrotext}</p>

    <h2>{$LANG.downloadscategories}</h2>

    <div class="row">
        {foreach $dlcats as $dlcat}
            <div class="col-sm-6">
                <a href="{routePath('download-by-cat', $dlcat.id, $dlcat.urlfriendlyname)}">
                    <i class="fa fa-folder-open-o"></i>
                    <strong>{$dlcat.name}</strong>
                </a>
                ({$dlcat.numarticles})
                <br>
                {$dlcat.description}
            </div>
        {foreachelse}
            <div class="col-sm-12">
                <p class="text-center fontsize3">{$LANG.downloadsnone}</p>
            </div>
        {/foreach}
    </div>

    <h2>{$LANG.downloadspopular}</h2>

    <div class="list-group">
        {foreach $mostdownloads as $download}
            <a href="{$download.link}" class="list-group-item">
                <strong>
                    <i class="fa fa-download"></i>
                    {$download.title}
                    {if $download.clientsonly}
                        <i class="fa fa-lock text-muted"></i>
                    {/if}
                </strong>
                <br>
                {$download.description}
                <br>
                <small>{$LANG.downloadsfilesize}: {$download.filesize}</small>
            </a>
        {foreachelse}
            <span class="list-group-item text-center">
                {$LANG.downloadsnone}
            </span>
        {/foreach}
    </div>
{/if}
