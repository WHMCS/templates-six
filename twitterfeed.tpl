{foreach from=$tweets key=num item=tweet}
    {if $num < $numtweets}
        <div class="tweet">
            <i class="fab fa-twitter fa-2x"></i>
            <p>
                {$tweet.tweet} <span>{$tweet.date}</span>
            </p>
        </div>
    {/if}
{/foreach}

<p>
    {$LANG.twitterfollowus} @<a href="https://twitter.com/{$twitterusername}" target="_blank">{$twitterusername}</a> {$LANG.twitterfollowuswhy}
</p>
