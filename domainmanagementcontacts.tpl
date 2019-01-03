<script>
jQuery(document).ready(function(){
	jQuery("div a").click(function() {
		jQuery(this).parent().children().removeClass("active");
		jQuery(this).addClass("active");
	});
});
</script>

{if $raasuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			<p>{$LANG.rcdom_raasuccess} <strong>{$regcEmailaddr}</strong></p>
		</ul>
	</div><br />
{/if}

{if $irtpsuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			<p>{$LANG.rcdom_irtpsuccess} {$LANG.rcdom_toword} <strong>{$current_regc_email}</strong> {$LANG.rcdom_andword} <strong>{$new_regc_email}</strong></p>
		</ul>
	</div><br />
{/if}

{if $raaverifystatus eq "Pending"}
	<div class="alert alert-warning">
		<p>{$LANG.rcdom_raapendingtitle}</p>
		<ul>
			<p>{$LANG.rcdom_raaverifybefore1} <strong>{$regcEmailaddr}</strong>. {$LANG.rcdom_raaverifybefore2} <strong>{$verifyenddate}</strong>{$LANG.rcdom_raaverifybefore3}</p>
			<form method="post" action="domainmanagement.php?action=domaincontacts">
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="irtprule" value="{$irtprule}"/>
				<input type="hidden" name="raa" value="resend"/>
				<p><input class="btn btn-success" type="submit" value="{$LANG.rcdom_raasendbutton}"/></p>
			</form>
		</ul>
	</div>
{/if}

{if $irtp_status eq "PENDING"}
	<div class="alert alert-warning">
		<p><strong>{$LANG.rcdom_irtppendingtitle}</strong></p><br />
		<ul>
			<table class="table">
				<tr>
					<th>{$LANG.rcdom_irtpregistranttitle}</th>
					<th>{$LANG.rcdom_irtpstatustitle}</th>
				</tr>
				<tr>
					<td>{$LANG.rcdom_currentregistranttitle} ({$current_regc_email})</td>
					<td>{$current_regc_status}</td>
				</tr>
				<tr>
					<td>{$LANG.rcdom_newregistranttitle} ({$new_regc_email})</td>
					<td>{$new_regc_status}</td>
				</tr>
			</table>
			<form method="post" action="domainmanagement.php?action=domaincontacts">
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="irtprule" value="{$irtprule}"/>
				<input type="hidden" name="irtp" value="resend"/>
				<p><input class="btn btn-success" type="submit" value="{$LANG.rcdom_irtpsendbutton}"/></p>
			</form>
		</ul>
	</div>
{/if}

<div class="tab-content margin-bottom">
    <div class="tab-pane fade in active" id="tabRegc">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactdesc}
		<table class="table table-bordered table-hover">
			<tr>
				<td colspan="2">
					<div class="pull-left">
						<h3>{$LANG.rcdom_regcdetails}</h3>
					</div>
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="tab" value="modifycontact"/>
							<input type="hidden" name="registrantContactId" value="{$regcContactid}"/>
							<input type="hidden" name="adminContactId" value="{$admincContactid}"/>
							<input type="hidden" name="techContactId" value="{$techcContactid}"/>
							<input type="hidden" name="billingContactId" value="{$billcContactid}"/>
							<input type="hidden" name="contactId" value="{$regcContactid}"/>
							<input class="btn btn-primary" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/>
						</form>
					</div>
					{if $canmod neq "false"}
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$regcContactid}"/>
							<input class="btn btn-primary" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/>
						</form>
					</div>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_contactidtitle}</strong></td>
				<td>{$regcContactid}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}</strong></td>
				<td>{$regcName}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacompanyname}</strong></td>
				<td>{$regcCompany}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.loginemail}</strong></td>
				<td>{$regcEmailaddr}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress1}</strong></td>
				<td>{$regcAddress1}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress2}</strong></td>
				<td>{$regcAddress2}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaaddress3}</strong></td>
				<td>{$regcAddress3}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareapostcode}</strong></td>
				<td>{$regcZip}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacity}</strong></td>
				<td>{$regcCity}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareastate}</strong></td>
				<td>{$regcState}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacountry}</strong></td>
				<td>{$regcCountry}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}</strong></td>
				<td>{$regcTelnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaphonenumber}</strong></td>
				<td>{$regcTelno}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}</strong></td>
				<td>{$regcFaxnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumber}</strong></td>
				<td>{$regcFaxno}</td>
			</tr>
		</table>
	</div>

    <div class="tab-pane fade" id="tabAdminc">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactdesc}	
		<table class="table table-bordered table-hover">
			<tr>
				<td colspan="2">
					<div class="pull-left">
						<h3>{$LANG.rcdom_admincdetails}</h3>
					</div>
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="tab" value="modifycontact"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="registrantContactId" value="{$regcContactid}"/>
							<input type="hidden" name="adminContactId" value="{$admincContactid}"/>
							<input type="hidden" name="techContactId" value="{$techcContactid}"/>
							<input type="hidden" name="billingContactId" value="{$billcContactid}"/>
							<input type="hidden" name="contactId" value="{$admincContactid}"/>
							<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/></p>
						</form>
					</div>
					{if $canmod neq "false"}
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$admincContactid}"/>
							<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/></p>
						</form>
					</div>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_contactidtitle}</strong></td>
				<td>{$admincContactid}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}</strong></td>
				<td>{$admincName}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacompanyname}</strong></td>
				<td>{$admincCompany}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.loginemail}</strong></td>
				<td>{$admincEmailaddr}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress1}</strong></td>
				<td>{$admincAddress1}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress2}</strong></td>
				<td>{$admincAddress2}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaaddress3}</strong></td>
				<td>{$admincAddress3}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareapostcode}</strong></td>
				<td>{$admincZip}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacity}</strong></td>
				<td>{$admincCity}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareastate}</strong></td>
				<td>{$admincState}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacountry}</strong></td>
				<td>{$admincCountry}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}</strong></td>
				<td>{$admincTelnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaphonenumber}</strong></td>
				<td>{$admincTelno}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}</strong></td>
				<td>{$admincFaxnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumber}</strong></td>
				<td>{$admincFaxno}</td>
			</tr>
		</table>	
	</div>
	
	<div class="tab-pane fade" id="tabTechc">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactdesc}	
		<table class="table table-bordered table-hover">
			<tr>
				<td colspan="2">
					<div class="pull-left">
						<h3>{$LANG.rcdom_techcdetails}</h3>
					</div>
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="tab" value="modifycontact"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="registrantContactId" value="{$regcContactid}"/>
							<input type="hidden" name="adminContactId" value="{$admincContactid}"/>
							<input type="hidden" name="techContactId" value="{$techcContactid}"/>
							<input type="hidden" name="billingContactId" value="{$billcContactid}"/>
							<input type="hidden" name="contactId" value="{$techcContactid}"/>
							<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/></p>
						</form>
					</div>
					{if $canmod neq "false"}
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$techcContactid}"/>
							<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/></p>
						</form>
					</div>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_contactidtitle}</strong></td>
				<td>{$techcContactid}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}</strong></td>
				<td>{$techcName}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacompanyname}</strong></td>
				<td>{$techcCompany}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.loginemail}</strong></td>
				<td>{$techcEmailaddr}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress1}</strong></td>
				<td>{$techcAddress1}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress2}</strong></td>
				<td>{$techcAddress2}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaaddress3}</strong></td>
				<td>{$techcAddress3}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareapostcode}</strong></td>
				<td>{$techcZip}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacity}</strong></td>
				<td>{$techcCity}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareastate}</strong></td>
				<td>{$techcState}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacountry}</strong></td>
				<td>{$techcCountry}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}</strong></td>
				<td>{$techcTelnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaphonenumber}</strong></td>
				<td>{$techcTelno}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}</strong></td>
				<td>{$techcFaxnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumber}</strong></td>
				<td>{$techcFaxno}</td>
			</tr>
		</table>	
	</div>

	<div class="tab-pane fade" id="tabBillc">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactdesc}	
		<table class="table table-bordered table-hover">
			<tr>
				<td colspan="2">
					<div class="pull-left">
						<h3>{$LANG.rcdom_billcdetails}</h3>
					</div>
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=changedomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="tab" value="modifycontact"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="registrantContactId" value="{$regcContactid}"/>
							<input type="hidden" name="adminContactId" value="{$admincContactid}"/>
							<input type="hidden" name="techContactId" value="{$techcContactid}"/>
							<input type="hidden" name="billingContactId" value="{$billcContactid}"/>
							<input type="hidden" name="contactId" value="{$billcContactid}"/>
							<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.rcdom_domaincontactmanagementbutton}"/></p>
						</form>
					</div>
					{if $canmod neq "false"}
					<div class="pull-right" style="padding:0px 3px 2px 0px;">
						<form method="post" action="domainmanagement.php?action=moddomaincontacts">
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>							
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="contactId" value="{$billcContactid}"/>
							<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.rcdom_currentcontactmanagementbutton}"/></p>
						</form>
					</div>
					{/if}
				</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_contactidtitle}</strong></td>
				<td>{$billcContactid}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}</strong></td>
				<td>{$billcName}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacompanyname}</strong></td>
				<td>{$billcCompany}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.loginemail}</strong></td>
				<td>{$billcEmailaddr}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress1}</strong></td>
				<td>{$billcAddress1}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaaddress2}</strong></td>
				<td>{$billcAddress2}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaaddress3}</strong></td>
				<td>{$billcAddress3}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareapostcode}</strong></td>
				<td>{$billcZip}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacity}</strong></td>
				<td>{$billcCity}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareastate}</strong></td>
				<td>{$billcState}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareacountry}</strong></td>
				<td>{$billcCountry}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}</strong></td>
				<td>{$billcTelnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.clientareaphonenumber}</strong></td>
				<td>{$billcTelno}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}</strong></td>
				<td>{$billcFaxnocc}</td>
			</tr>
			<tr>
				<td><strong>{$LANG.rcdom_clientareafaxnumber}</strong></td>
				<td>{$billcFaxno}</td>
			</tr>
		</table>
	</div>
	
	<div class="tab-pane fade" id="tabWhoisid">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_whoisiddesc}
		<div class="internalpadding">
			{if $idprotecterror}
			<br />
			<div class="alert alert-danger">
				<p>{$LANG.clientareaerrors}</p>
				<ul>
					{$idprotecterror}
				</ul>
			</div>
			{/if}
			
			{if $idprotectsuccess}
			<br />
			<div class="alert alert-success">
				<p>{$LANG.moduleactionsuccess}</p>
				<ul>
					{$idprotectsuccess}
				</ul>
			</div>
			{/if}
		
			{if $isprivacyallowed neq "true"}
			<table class="table table-bordered table-hover">
				<tr>
					<td class="textcenter">
						<h3>{$LANG.rcdom_idwhoistitle}</h3>
					</td>
				</tr>
				<tr>
					<td align="center"><strong>{$LANG.rcdom_idprotectionnotavailable}</strong></td>
				</tr>
			</table>
			{else}
			<form method="post" action="domainmanagement.php?action=domaincontacts#tabWhoisid">
				<input type="hidden" name="request" value="doidprotect"/>
				<input type="hidden" name="domain" value="{$domain}"/>
				<input type="hidden" name="domainid" value="{$domainid}"/>
				<input type="hidden" name="irtprule" value="{$irtprule}"/>
				<input type="hidden" name="tab" value="modifywhois"/>
				<table class="table table-hover">
					<tr>
						<td colspan="2">
							<h3>
								{$LANG.rcdom_idwhoistitle}
								{$LANG.rcdom_idprotectioncurrentstatus}:
								{if $isprivacyon eq "true"}
									<span class="label label-success">{$LANG.rcdom_idprotectionenabled}</span>
								{else}
									<span class="label label-danger">{$LANG.rcdom_idprotectiondisabled}</span>
								{/if}
							</h3>
						</td>
					</tr>
					<tr>
						<td style="vertical-align: middle;">
							<input name="privacystatus" type="checkbox" {if $isprivacyon eq "true"} checked="checked"{/if}/>
						</td>
						<td>
							{$LANG.rcdom_idprotectioncheck}<br />{$LANG.rcdom_idprotectionuncheck}
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p align="center"><input type="submit" class="btn btn-success" value="{$LANG.clientareasavechanges}"/></p>
						</td>
					</tr>
				</table>
			</form>
			{/if}
		</div>	
	</div>
</div>