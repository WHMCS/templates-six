<h2>{$kbarticle.title}</h2>

{if $kbarticle.voted}
    {include file="$template/includes/alert.tpl" type="success" msg="{lang key="knowledgebaseArticleRatingThanks"}" textcenter=true}
{/if}

<blockquote>
    {$kbarticle.text}
</blockquote>
<div class="hidden-print">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                {if $kbarticle.voted}{$LANG.knowledgebaserating}{else}{$LANG.knowledgebasehelpful}{/if}
            </h3>
        </div>
        <div class="panel-body">
            {if $kbarticle.voted}
                {$kbarticle.useful} {$LANG.knowledgebaseratingtext} ({$kbarticle.votes} {$LANG.knowledgebasevotes})
            {else}
                <form action="{if $seofriendlyurls}{$WEB_ROOT}/knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}" method="post">
                    <input type="hidden" name="useful" value="vote">
                    <button type="submit" name="vote" value="yes" class="btn btn-success"><i class="fa fa-thumbs-o-up"></i> {$LANG.knowledgebaseyes}</button>
                    <button type="submit" name="vote" value="no" class="btn btn-default"><i class="fa fa-thumbs-o-down"></i> {$LANG.knowledgebaseno}</button>
                </form>
            {/if}
        </div>
    </div>
    <a href="#" class="btn btn-success btn-block" onclick="window.print();return false"><i class="fa fa-print">&nbsp;</i>{$LANG.knowledgebaseprint}</a>
</div>
{if $kbarticles}
    <h3 class="kb-alsoread">
        {$LANG.knowledgebasealsoread}
    </h3>
    <div class="kbarticles">
        {foreach key=num item=kbarticle from=$kbarticles}
            <div>
                <a href="{if $seofriendlyurls}{$WEB_ROOT}/knowledgebase/{$kbarticle.id}/{$kbarticle.urlfriendlytitle}.html{else}knowledgebase.php?action=displayarticle&amp;id={$kbarticle.id}{/if}">
                    <i class="glyphicon glyphicon-file"></i> {$kbarticle.title}
                </a>
                <p>{$kbarticle.article|truncate:100:"..."}</p>
            </div>
        {/foreach}
    </div>
{/if}
