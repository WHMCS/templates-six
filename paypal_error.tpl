<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css" />
<div id="order-ajaxcart">
  <h2>PayPal Error</h2>
  {if $invoiceid && !$ispaid}
  <div class="errorbox">
    {$LANG.ordercompletebutnotpaid}
  </div>
  </br></br>
  <div style="text-align:center;">
    <p>Your payment failed at PayPal. Please contact us or view your invoice below and pay with a different method. You can also manage your PayPal Billing Agreement with us by using the button below.</p>
    </br>
	<hr>
    <b>{$errormessage}</b> 
</br>
PayPal Error Code: {$errorcode}
</br>
<hr>
	
    <!--If Error Message shows that reference transactions are not enabled. -->
    {if $errormessage|strstr:"Buyer did not accept billing agreement"} 
    </br>
    Reference Transactions still need to be enabled in your PayPal Account.
	<hr>
    {/if}
	
    <!--If Error Message shows no backup payment methods were available. -->
    {if $errormessage|strstr:"alternative payment method from the customers PayPal wallet"} 
    </br>
    Please add funds to your PayPal account or add a valid form of backup payment. Use this button to manage your PayPal Account funding methods. </br></br>
    <a href="https://www.paypal.com/webapps/customerprofile/summary.view" class="btn btn-primary"><i class="fa fa-paypal"></i> Manage PayPal Funding Sources</a> 
	<hr>
    {/if}
	
    </br>
    <a href="viewinvoice.php?id={$invoiceid}" class="btn btn-success"><i class="fa fa-credit-card"></i> View Invoice</a>
    <a href="paypalbilling.php" class="btn btn-info"><i class="fa fa-paypal"></i> Manage Paypal Billing Agreement</a> 
  </div>
  {/if}
  <br />
</div>