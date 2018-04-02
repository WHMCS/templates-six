<div id="sitelockLogin" class="panel panel-default panel-mc-sso panel-accent-silver">
    <div class="panel-body">
        <div class="row">
            <div class="col-sm-4 text-center">
                <div class="icon-container">
                    <img src="assets/img/marketconnect/sitelock/logo-sml.png">
                </div>
            </div>
            <div class="col-sm-8">

                <h3>{lang key="store.sitelock.title"}</h3>
                <h4>{lang key="store.sitelock.manageService"}</h4>
                <form action="{routePath('upgrade')}" method="post">
                    <input type="hidden" name="action" value="manage-service" />
                    <p>
                        {if count($accounts) > 1}
                            <select id="sitelockId" name="service-id" class="form-control select-inline">
                                {foreach $accounts as $account}
                                    <option value="{if $account.type == 'addon'}a{/if}{$account.id}">{$account.domain}</option>
                                {/foreach}
                            </select>
                        {else}
                            <input type="hidden" name="service-id" value="{if $accounts[0].type == 'addon'}a{/if}{$accounts[0].id}">
                        {/if}
                    </p>
                    <button type="button" class="btn btn-default btn-service-sso">
                        <span class="loading hidden">
                            <i class="fa fa-spinner fa-spin"></i>
                        </span>
                        <span class="text">{lang key="manage"}</span>
                    </button>
                    {if count($accounts) == 1}
                        <input type="hidden" name="isproduct" value="{if $accounts[0].type == 'addon'}0{else}1{/if}">
                        <input type="hidden" name="serviceid" value="{$accounts[0].id}">
                        <button type="submit" class="btn btn-default">
                            {lang key="upgrade"}
                        </button>
                    {/if}
                    <span class="login-feedback"></span>
                </form>

            </div>
        </div>

    </div>
</div>
