<a class="twitter-timeline" href="https://twitter.com/{$twitterusername}" data-height="600" data-chrome="noheader nofooter" data-dnt="true">Tweets by {$twitterusername}</a>

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

{literal}
    <script>
        var observerConfig = { attributes: true, childList: true, subtree: true },
            observerTwitterWidget = new MutationObserver(removeRetweets),
            elementsWaitTimeout = null;

        function removeRetweets() {
            jQuery('#twitter-widget-0')
                .contents()
                .find('.timeline-Tweet--isRetweet')
                .parent('li')
                .remove();
        }

        function addTwitterWidgetObserverWhenNodeAvailable() {
            if (elementsWaitTimeout) {
                clearTimeout(elementsWaitTimeout);
            }

            var targetTwitterWidget = document.getElementById('twitter-widget-0');

            if (!targetTwitterWidget) {
                elementsWaitTimeout = window.setTimeout(addTwitterWidgetObserverWhenNodeAvailable, 500);
                return;
            }

            var targetTimelineTweets = targetTwitterWidget
                .contentWindow
                .document
                .getElementsByClassName('timeline-TweetList')[0];

            if (!targetTimelineTweets) {
                elementsWaitTimeout = window.setTimeout(addTwitterWidgetObserverWhenNodeAvailable, 500);
                return;
            }

            jQuery('#twitter-widget-0')
                .contents()
                .find('head')
                .append("<style>.timeline-Tweet-text {font-size: 18px !important; line-height: 25px !important; margin-bottom: 0px !important;}</style>");

            removeRetweets();

            observerTwitterWidget.observe(targetTimelineTweets, observerConfig);
        }

        addTwitterWidgetObserverWhenNodeAvailable();
    </script>
{/literal}

<p>
    {$LANG.twitterfollowus} @<a href="https://twitter.com/{$twitterusername}" target="_blank">{$twitterusername}</a> {$LANG.twitterfollowuswhy}
</p>
