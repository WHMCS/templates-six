<h3>{$LANG.kbsuggestions}</h3>

<p>{$LANG.kbsuggestionsexplanation}</p>

<div class="kbarticles">
    {foreach from=$kbarticles item=kbarticle}
        <p>
            <a href="knowledgebase.php?action=displayarticle&id={$kbarticle.id}" target="_blank">
                <span class="glyphicon glyphicon-file"></span>
                {$kbarticle.title}
            </a> - {$kbarticle.article}...
        </p>
    {/foreach}
</div>
