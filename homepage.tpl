{if $twitterusername}

    <h2>{$LANG.twitterlatesttweets}</h2>

    <div id="twitterFeedOutput">
        <p class="text-center"><img src="{$BASE_PATH_IMG}/loading.gif" /></p>
    </div>

    <script type="text/javascript" src="templates/{$template}/js/twitter.js"></script>

{elseif $announcements}

    <h2>{$LANG.news}</h2>

    {foreach $announcements as $announcement}
        {if $announcement@index < 2}
            <div class="announcement-single">
                <h3>
                    <span class="label label-default">
                        {$announcement.rawDate|date_format:"M jS"}
                    </span>
                    <a href="{if $seofriendlyurls}{$WEB_ROOT}/announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}">{$announcement.title}</a>
                </h3>

                <blockquote>
                    <p>
                        {if $announcement.text|strip_tags|strlen < 350}
                            {$announcement.text}
                        {else}
                            {$announcement.summary}
                            <a href="{if $seofriendlyurls}{$WEB_ROOT}/announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}" class="label label-warning">{$LANG.readmore} &raquo;</a>
                        {/if}
                    </p>
                </blockquote>

                {if $announcementsFbRecommend}
                    <script>
                        (function(d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) {
                                return;
                            }
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
                            fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));
                    </script>
                    <div class="fb-like hidden-sm hidden-xs" data-layout="standard" data-href="{$systemurl}{if $seofriendlyurls}{$WEB_ROOT}/announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                    <div class="fb-like hidden-lg hidden-md" data-layout="button_count" data-href="{$systemurl}{if $seofriendlyurls}{$WEB_ROOT}/announcements/{$announcement.id}/{$announcement.urlfriendlytitle}.html{else}announcements.php?id={$announcement.id}{/if}" data-send="true" data-width="450" data-show-faces="true" data-action="recommend"></div>
                {/if}
            </div>
        {/if}
    {/foreach}
{/if}
<html>
<body>
<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: 'Open Sans', Verdana, Tahoma, serif; font-size: 16px; line-height: 22.8571px; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18px;">XYZulu have been in the hosting business for over 15 years. Unlike other hosts, we actually have access to all our customer servers.&nbsp;Our offerings are aimed at people who are proficient enough to manage their own website, but may also require some help with setting up DNS, Email, CDN etc.</span></p>

<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: 'Open Sans', Verdana, Tahoma, serif; font-size: 16px; line-height: 22.8571px; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18px;">We offer a number of free options to help optimize and manage your Joomla/Wordpress/Drupal&nbsp;website as well as any other scripts you may want to host with us.&nbsp;</span></p>

<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: 'Open Sans', Verdana, Tahoma, serif; font-size: 16px; line-height: 22.8571px; background-color: rgb(255, 255, 255);">&nbsp;</p>

<p style="box-sizing: border-box; margin: 0px 0px 10px; color: rgb(51, 51, 51); font-family: 'Open Sans', Verdana, Tahoma, serif; font-size: 16px; line-height: 22.8571px; text-align: center; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 13px; line-height: 18px;">You can read more about some of the services we offer on our&nbsp;<a href="https://www.facebook.com/xyzulu.host/" style="box-sizing: border-box; color: rgb(0, 85, 136); text-decoration: none; background-color: transparent;" target="_blank">Facebook page</a></span></p>
</body>
</html>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div align="center" style="background:#eee;border:1px solid #ccc;padding:5px 10px;"><span style="font-family:arial,helvetica,sans-serif;">We also offer: <a href="http://ontimemarketing.com.au" target="_blank">Design Services</a> | <a href="https://my.xyzulu.com/index.php" target="_blank">Domain Registration</a> | <a href="https://www.facebook.com/xyzulu.host" target="_blank">IT Consulting</a></span></div>
</body>
</html>
