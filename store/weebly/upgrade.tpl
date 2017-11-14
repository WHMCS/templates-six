<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="container">
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1 col-md-12 col-md-offset-0 col-sm-10 col-sm-offset-1">

            <div class="weebly-upgrade-container">

                <div class="row">
                    <div class="col-md-6">

                        <div class="content-padded">
                            <img src="{$WEB_ROOT}/assets/img/marketconnect/weebly/logo.png">
                            <h2>Upgrade Required</h2>
                            <p>To access the functionality you requested, you need to upgrade your Weebly Site Builder plan.</p>
                            {if $loggedin}
                                <p>The recommended plan is displayed.</p>
                            {else}
                                <p>To view the available options, please login.</p>
                            {/if}
                        </div>

                    </div>
                    <div class="col-md-6">

                        <div class="promo-wrapper">
                            {if $loggedin}
                                {if count($weeblyServices) > 0}
                                    {if is_null($product)}
                                        <h3>No upgrade available</h3>
                                        <p>There is no upgrade available at this time.</p>
                                        <p><a href="submitticket.php">Contact support</a></p>
                                    {else}
                                        <h3 class="text-center">{$promo->getHeadline()}</h3>
                                        <h4 class="text-center">{$promo->getTagline()}</h4>
                                        {if $promo->hasHighlights()}
                                            <ul>
                                                {foreach $promo->getHighlights() as $highlight}
                                                    <li>{$highlight}</li>
                                                {/foreach}
                                            </ul>
                                        {/if}
                                        <form method="post" action="{routePath('store-weebly-upgrade-order')}">
                                            <select name="service" class="form-control weebly-service-select{if count($weeblyServices) == 1} hidden{/if}">
                                                {foreach $weeblyServices as $service}
                                                    <option value="{$service.type}-{$service.id}">{$service.domain}</option>
                                                {/foreach}
                                            </select>
                                            <button type="submit" class="btn btn-success btn-block">
                                                Upgrade to {$product->name} for {$product->pricing()->first()->breakdownPrice()}
                                            </button>
                                        </form>
                                    {/if}
                                {else}
                                    <h3>No active Weebly plans found</h3>
                                    <p>You are currently logged in as {$loggedinuser.email}</p>
                                    <p><a href="logout.php?redirect=store-weebly-upgrade">Logout/switch user</a></p>
                                {/if}
                            {else}
                                {include file="$template/login.tpl" incorrect=$incorrect}
                            {/if}
                        </div>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
