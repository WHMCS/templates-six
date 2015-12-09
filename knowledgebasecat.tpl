<form role="form" method="post" action="{$WEB_ROOT}/knowledgebase.php?action=search">
    <div class="input-group">
        <input type="text" name="search" class="form-control" placeholder="{$LANG.kbsearchexplain}" value="{$searchterm}" />
        <span class="input-group-btn">
            <input type="submit" class="btn btn-primary btn-input-padded-responsive" value="{$LANG.search}" />
        </span>
    </div>
</form>

{if $kbcats}
    <h2>{$LANG.knowledgebasecategories}</h2>

    <div class="row kbcategories">
        {foreach name=kbasecats from=$kbcats item=kbcat}
            <div class="col-sm-4">
                <a href="{if $seofriendlyurls}{$WEB_ROOT}/knowledgebase/{$kbcat.id}/{$kbcat.urlfriendlyname}{else}knowledgebase.php?action=displaycat&amp;catid={$kbcat.id}{/if}">
                    <span class="glyphicon glyphicon-folder-close"></span> {$kbcat.name} <span class="badge badge-info">{$kbcat.numarticles}</span>
                </a>
                <p>{$kbcat.description}</p>
            </div>
        {/foreach}
    </div>
{/if}

{if $kbarticles || !$kbcats}
    {if $tag}
        <h2>{$LANG.kbviewingarticlestagged} '{$tag}'</h2>
    {else}
        <h2>{$LANG.knowledgebasearticles}</h2>
    {/if}

    <div class="kbarticles">
        {foreach from=$kbarticles item=kbarticle}
            <a href="{if $seofriendlyurls}{$WEB_ROOT}/knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}">
                <span class="glyphicon glyphicon-file"></span>&nbsp;{$kbarticle.title}
            </a>
            <p>{$kbarticle.article|truncate:100:"..."}</p>
        {foreachelse}
            {include file="$template/includes/alert.tpl" type="info" msg=$LANG.knowledgebasenoarticles textcenter=true}
        {/foreach}
    </div>
{/if}
