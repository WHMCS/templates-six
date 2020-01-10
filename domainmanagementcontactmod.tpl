<script>
jQuery(document).ready(function(){
	jQuery("div a").click(function() {
		jQuery(this).parent().children().removeClass("active");
		jQuery(this).addClass("active");
	});
});
</script>

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactinfomoddesc2}

{if $contactmoderror}
	<br />
	<div class="alert alert-danger">
		<p>{$LANG.clientareaerrors}</p>
		<ul>
			{$contactmoderror}
		</ul>
	</div>
{/if}

{if $contactmodsuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			{$contactmodsuccess}
		</ul>
	</div>
{/if}

<form method="post" action="domainmanagement.php?action=moddomaincontacts">
	<table class="table table-bordered table-hover">
		<tr>
			<td class="textcenter" colspan="2">
				<h3>{$LANG.rcdom_modifydomaincontactinfo}</h3>
			 	{if $irtprule eq "true"}
					{include file="$template/includes/alert.tpl" type="warning" msg=$LANG.rcdom_contactinfomoddesc3}
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.rcdom_contactidtitle}</strong></td>
			<td>{$contactId}</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}</strong></td>
			<td>
				{if $namemod eq "false"}
					{$contactName}<input name="name" value="{$contactName}" type="hidden"/>
				{else}
					<input name="name" value="{$contactName}" class="form-control" type="text" id="name" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareacompanyname}</strong></td>
			<td>
				{if $companymod eq "false"}
					{$contactCompany}<input name="company" value="{$contactCompany}" type="hidden"/>
				{else}
					<input name="company" value="{$contactCompany}" class="form-control" type="text" id="company" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.loginemail}</strong></td>
			<td>
			{if $emailmod eq "false"}
				{$contactEmailaddr}<input name="emailAddr" value="{$contactEmailaddr}" type="hidden"/>
			{else}
				<input name="emailAddr" value="{$contactEmailaddr}" class="form-control" type="text" id="company" size="30"/>
			{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareaaddress1}</strong></td>
			<td>
				{if $restricted eq "false"}
					{$contactAddress1}<input name="address1" value="{$contactAddress1}" type="hidden"/>
				{else}
					<input name="address1" value="{$contactAddress1}" class="form-control" type="text" id="address1" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareaaddress2}</strong></td>
			<td>
				{if $restricted eq "false"}
					{$contactAddress2}<input name="address2" value="{$contactAddress2}" type="hidden"/>
				{else}
					<input name="address2" value="{$contactAddress2}" class="form-control" type="text" id="address2" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.rcdom_clientareaaddress3}</strong></td>
			<td>
				{if $restricted eq "false"}
					{$contactAddress3}<input name="address3" value="{$contactAddress3}" type="hidden"/>
				{else}
					<input name="address3" value="{$contactAddress3}" class="form-control" type="text" id="address3" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareapostcode}</strong></td>
			<td>
				{if $restricted eq "false"}
					{$contactZip}<input name="zip" value="{$contactZip}" type="hidden"/>
				{else}
					<input name="zip" value="{$contactZip}" class="form-control" type="text" id="zip" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareacity}</strong></td>
			<td>
				{if $restricted eq "false"}
					{$contactCity}<input name="city" value="{$contactCity}" type="hidden"/>
				{else}
					<input name="city" value="{$contactCity}" class="form-control" type="text" id="city" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareastate}</strong></td>
			<td>
				{if $restricted eq "false"}
					{$contactState}<input name="state" value="{$contactState}" type="hidden"/>
				{else}
					<input name="state" value="{$contactState}" class="form-control" type="text" id="state" size="30"/>
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareacountry}</strong></td>
			<td>
				{if $restricted eq "false"}
					{$contactCountry}<input name="country" value="{$contactCountry}" type="hidden"/>
				{else}
					{$dropdowncountries}
				{/if}
			</td>
		</tr>
		<tr>
			<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}</strong></td>
			<td><input name="telNoCc" class="form-control" type="text" id="telNoCc" value="{$contactTelnocc}" size="3" maxlength="3"/></td>
		</tr>
		<tr>
			<td><strong>{$LANG.clientareaphonenumber}</strong></td>
			<td><input name="telNo" value="{$contactTelno}" class="form-control" type="text" id="telNo" size="10"/></td>
		</tr>
		<tr>
			<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}</strong></td>
			<td><input name="faxNoCc" class="form-control" type="text" id="faxNoCc" value="{$contactFaxnocc}" size="3" maxlength="3"/></td>
		</tr>
		<tr>
			<td><strong>{$LANG.rcdom_clientareafaxnumber}</strong></td>
			<td><input name="faxNo" value="{$contactFaxno}" class="form-control" type="text" id="faxNo" size="10"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="hidden" name="request" value="domodify">
				<input type="hidden" name="contactId" value="{$contactId}">
				<input type="hidden" name="domainid" value="{$domainid}">
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="productkey" value="{$contactproductkey}">
				<input type="hidden" name="irtprule" value="{$irtprule}">
				<p align="center"><input class="btn btn-success" type="submit" value="{$LANG.clientareasavechanges}"></p>
			</td>
		</tr>
	</table>
	<br />
</form>