	{if empty($number) and empty($bid)}
	<div style="margin:0 0 10px 0;padding:10px 35px;background-color:#ffffd2;color:#555;font-size:16px;text-align:center;"><strong>Warning!</strong> Reference Transactions are not yet set up on the admin PayPal Account. See our documentation <a href="https://docs.myworks.software/whmcs-paypal-billing-gateway/documentation/whmcs-paypal-billing-module-reference-transactions-overview">here</a> to set them up.</div>
	{/if}
	  <div class="col-md-12 pull-md-right">
        <p class="well" style="font-size:16px;">
	{if isset($bid)}
			 <strong>{$LANG.pb_billingheader}</strong> :
          {$bid}
        </p>
        <div class="jumbotron well">
          <h1> 
            {$LANG.pb_activetext}
          </h1>
	      
	        <img style="position: relative; float:right; top: 50%; transform: translateY(-40%);" src="modules/addons/paypal_billing_center/img/right-mark.png">
	      
          </br>
          <p>
			  {$LANG.pb_clientdesc}

          </p>
	{elseif $sid|@count !== 0}
<strong>{$LANG.pb_subscriptionheader}</strong>:</br>
{foreach from=$sid item=foo}
    {$foo}</br>
{/foreach}

          </p>
          <div class="jumbotron well">
            <h1> 

              {$LANG.pb_notsetuptext}
              
            </h1>
            </br>
            <p>
  			  {$LANG.pb_subscriptionclientdesc}
              {if isset($autocanceltext)}
              {$LANG.pb_autocancel}
              {/if}
            </p>
			
		  {else}
  			 <strong>{$LANG.pb_billingheader}</strong> :
            {$LANG.pb_nobid}
          </p>
          <div class="jumbotron well">
            <h1> 
              {$LANG.pb_notsetuptext}
            </h1>
	        <img style="position: relative; float:right; top: 50%; transform: translateY(-50%);" src="modules/addons/paypal_billing_center/img/wrong-mark.png">
            </br>
            <p>
  			  {$LANG.pb_clientdesc}
            </p>
		  {/if}
          <hr/>
          {if isset($bid)} 
          <form name="BAsettings" id="BAsettingsform" action="" method="post">
            <input type="hidden" name="userid"  value="{$clientsdetails.id}">
            <input type="hidden" name="BAUpdate_id" value="{$bid}">
            <input type="submit"  class="btn btn-primary btn-large" name="BAUpdate_cancel" value="{$LANG.pb_cancel}">	
          </form>
          {else} 
          <a href="{$paypal_url}?token={$number}"><input type="submit" id="baCreat"class="btn btn-primary btn-large" name="BACreate" value="{$LANG.pb_create}"></a>			
          {/if}
        </div>
    </div>
<hr/>