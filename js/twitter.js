/**
 * Javascript functions used to fetch the twitter feed.
 *
 * @file WHMCS Six Theme Twitter Javascript Function
 * @copyright Copyright 2020 WHMCS Limited
 */

jQuery(document).ready(function() {
    WHMCS.http.jqClient.post("index.php?rp=/announcements/twitterfeed",
        function(data) {
            jQuery("#twitterFeedOutput").html(data);
        });
});
