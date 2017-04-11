<div id="seLogin" class="panel panel-default panel-accent-silver promo-banner product-details">
    <div class="panel-body">
        <div class="icon">
            <img src="assets/img/marketconnect/spamexperts/logo.png">
        </div>
        <h3>Spam Experts</h3>
        <h4>Manage your Spam Experts Service</h4>
        <form action="" method="post">
            <input type="hidden" name="action" value="manage-service" />
            <p>
                {if count($accounts) > 1}
                    <select id="spamExpertId" name="service-id" class="form-control select-inline">
                        {foreach $accounts as $account}
                            <option value="{if $account.type == 'addon'}a{/if}{$account.id}">{$account.domain}</option>
                        {/foreach}
                    </select>
                {else}
                    <input type="hidden" name="service-id" value="{if $accounts[0].type == 'addon'}a{/if}{$accounts[0].id}">
                {/if}
            </p>
            <button class="btn btn-service-sso">
                <span class="loading hidden">
                    <i class="fa fa-spinner fa-spin"></i>
                </span>
                <span class="text">Manage</span>
            </button>
            <span class="login-feedback"></span>
        </form>
    </div>
</div>
