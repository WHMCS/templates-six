<script>
	jQuery(document).ready(function(){
		jQuery("div a").click(function() {
			jQuery(this).parent().children().removeClass("active");
			jQuery(this).addClass("active");
		});
	});
</script>

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<script language="javascript" type="text/javascript">
	function confirmDelete(){literal}{{/literal}return confirm("{$LANG.rcdom_contactdeletewarn}");{literal}}{/literal}
</script>

<div class="tab-content margin-bottom">
    <div class="tab-pane fade in active" id="tabModify">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactinfomoddesc}
		{if $canmod neq "false"}
			<form method="post" action="domainmanagement.php?action=moddomaincontacts#tabModify">
				<table class="table table-bordered table-hover">
					<tr>
						<td class="textcenter" colspan="2">
							<h3>{$LANG.rcdom_contactinfomodtitle}</h3>
						</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_domaincontactinfo}</strong></td>
						<td>
							<select name="contactId" id="contactId" class="form-control">
							{foreach from=$contacts key=value item=id}
								<option value="{$id.contactid}" {if $smarty.request.contactId eq $id.contactid} selected="selected" style="background-color:#DFF0D8;"{/if}>
								{foreach from=$id key=key item=item}
									{$item}
								{/foreach}
								</option>
							{/foreach}
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<p align="center"><input class="btn btn-primary" type="submit" value="{$LANG.rcdom_contactinfomodbutton}"/></p>
						</td>
					</tr>
				</table>
			</form>
		{else}
			<div class="alert alert-warning">
				{$LANG.rcdom_nocontactmod}<br />
			</div>
		{/if}		
	</div>
	
	<div class="tab-pane fade" id="tabChange">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactinfochangedesc}
		{if $canchange neq "false"}
			{if $contactseterror}
			<br />
			<div class="alert alert-danger">
				<p>{$LANG.clientareaerrors}</p>
				<ul>
					{$contactseterror}
				</ul>
			</div>
			{/if}

			{if $contactsetsuccess}
			<br />
			<div class="alert alert-success">
				<p>{$LANG.moduleactionsuccess}</p>
				<ul>
					{$contactsetsuccess}
				</ul>
			</div>
			{/if}

			<form method="post" action="domainmanagement.php?action=changedomaincontacts#tabChange">
				<table class="table table-bordered table-hover">
					<tr>
						<td class="textcenter" colspan="2">
							<h3>{$LANG.rcdom_contactinfochangetitle}</h3>
						</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_regc}</strong><br />(reg-c)</td>
						<td>
							<select name="registrantContactId" id="registrantContactId" class="form-control">
								{foreach from=$contacts key=value item=id}
									<option value="{$id.contactid}" {if $smarty.request.regcontactid eq $id.contactid || $smarty.request.registrantContactId eq $id.contactid || $regcContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>
									{foreach from=$id key=key item=item}
										{$item}
									{/foreach}
									</option>
								{/foreach}
							</select>
						</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_adminc}</strong><br />(admin-c)</td>
						<td>
							<select name="adminContactId" id="adminContactId" class="form-control">
								{foreach from=$contacts key=value item=id}
									<option value="{$id.contactid}" {if $smarty.request.admincontactid eq $id.contactid || $smarty.request.adminContactId eq $id.contactid || $admincContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>
									{foreach from=$id key=key item=item}
										{$item}
									{/foreach}
									</option>
								{/foreach}
							</select>
						</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_techc}</strong><br />(tech-c)</td>
						<td>
							<select name="techContactId" id="techContactId" class="form-control">
								{foreach from=$contacts key=value item=id}
									<option value="{$id.contactid}" {if $smarty.request.techcontactid eq $id.contactid || $smarty.request.techContactId eq $id.contactid || $techcContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>
									{foreach from=$id key=key item=item}
										{$item}
									{/foreach}
									</option>
								{/foreach}
							</select>
						</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_billc}</strong><br />(bill-c)</td>
						<td>
							<select name="billingContactId" id="billingContactId" class="form-control">
								{foreach from=$contacts key=value item=id}
									<option value="{$id.contactid}" {if $smarty.request.billcontactid eq $id.contactid || $smarty.request.billingContactId eq $id.contactid || $billcContactid eq $id.contactid} selected="selected" style="background-color:#DFF0D8;" {/if}>
									{foreach from=$id key=key item=item}
										{$item}
									{/foreach}
									</option>
								{/foreach}
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<p>
								<input name="da" type="radio" value="true" checked /> {$LANG.rcdom_datitle1}
								<br />
								<small>
									{$LANG.rcdom_dadesc1}
								</small>
							</p>
							<p>
								<input name="da" type="radio" value="false" {if $da_value eq "false"}checked{/if} /> {$LANG.rcdom_datitle2}
								<br />
								<small>
									{$LANG.rcdom_dadesc2}
								</small>
							</p>
						</td>
					</tr>					
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="request" value="dochange"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="tab" value="changecontact"/>
							<input type="hidden" name="contactId" value="{$smarty.request.contactId}"/>
							<p align="center"><input class="btn btn-success" type="submit" value="{$LANG.clientareasavechanges}"/></p>
						</td>
					</tr>
				</table>
			</form>
		{else}
			<div class="alert alert-warning">
				{$LANG.rcdom_nocontactchange}<br />
			</div>
		{/if}	
	</div>

	<div class="tab-pane fade" id="tabDelete">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactinfodeldesc}
		{if $candelete neq "false"}
			{if $contactdeleteerror}
			<br />
			<div class="alert alert-danger">
				<p>{$LANG.clientareaerrors}</p>
				<ul>
					{$contactdeleteerror}
				</ul>
			</div>
			{/if}
	
			{if $contactdeletesuccess}
			<br />
			<div class="alert alert-success">
				<p>{$LANG.moduleactionsuccess}</p>
				<ul>
					{$contactdeletesuccess}
				</ul>
			</div>
			{/if}
	
			<form method="post" action="domainmanagement.php?action=changedomaincontacts#tabDelete">
				<table class="table table-bordered table-hover">
					<tr>
						<td class="textcenter" colspan="2">
							<h3>{$LANG.rcdom_contactinfodeltitle}</h3>
						</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_domaincontactinfo}</strong></td>
						<td>
							<select name="contactId" id="contactId" class="form-control">
							{foreach from=$contacts key=value item=id}
								<option value="{$id.contactid}" {if $smarty.request.contactId eq $id.contactid} selected="selected" style="background-color:#DFF0D8;"{/if}>
								{foreach from=$id key=key item=item}
									{$item}
								{/foreach}
								</option>
							{/foreach}
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="hidden" name="request" value="dodelete"/>
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="tab" value="deletecontact"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<p align="center"><input class="btn btn-danger" type="submit" value="{$LANG.rcdom_contactinfodelbutton}" onclick="return confirmDelete();"/>	</p>
						</td>
					</tr>
				</table>
			</form>
		{else}
			<div class="alert alert-warning">
				{$LANG.rcdom_nocontactdel}<br />
			</div>
		{/if}
	</div>
	
	<div class="tab-pane fade" id="tabCreate">
		{include file="$template/includes/alert.tpl" type="info" msg=$LANG.rcdom_contactinfocreatedesc}
		{if $cancreate neq "false"}
			{if $contactcreateerror}
			<br />
			<div class="alert alert-danger">
				<p>{$LANG.clientareaerrors}</p>
				<ul>
					{$contactcreateerror}
				</ul>
			</div>
			{/if}
	
			{if $contactcreatesuccess}
			<br />
			<div class="alert alert-success">
				<p>{$LANG.moduleactionsuccess}</p>
				<ul>
					{$contactcreatesuccess}
				</ul>
			</div>
			{/if}			
			
			<form method="post" action="domainmanagement.php?action=changedomaincontacts#tabCreate">
				<table class="table table-bordered table-hover">
					<tr>
						<td class="textcenter" colspan="2">
							<h3>{$LANG.rcdom_contactinfocreatetitle}</h3>
						</td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareafirstname} {$LANG.clientarealastname}</strong></td>
						<td><input name="name" class="form-control" type="text" id="name" value="{$smarty.post.name}" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareacompanyname}</strong></td>
						<td><input name="company" class="form-control" type="text" value="{$smarty.post.company}" id="company" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.loginemail}</strong></td>
						<td><input name="emailAddr" class="form-control" type="text" value="{$smarty.post.emailAddr}" id="emailAddr" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareaaddress1}</strong></td>
						<td><input name="address1" class="form-control" type="text" id="address1" value="{$smarty.post.address1}" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareaaddress2}</strong></td>
						<td><input name="address2" class="form-control" type="text" value="{$smarty.post.address2}" id="address2" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_clientareaaddress3}</strong></td>
						<td><input name="address3" class="form-control" type="text" value="{$smarty.post.address3}" id="address3" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareapostcode}</strong></td>
						<td><input name="zip" class="form-control" type="text" value="{$smarty.post.zip}" id="zip" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareacity}</strong></td>
						<td><input name="city" class="form-control" type="text" value="{$smarty.post.city}" id="city" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareastate}</strong></td>
						<td><input name="state" class="form-control" type="text" value="{$clientstate}" id="state" size="30" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareacountry}</strong></td>
						<td>{$dropdowncountries}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_clientareaphonenumberprefix}</strong></td>
						<td><input name="telNoCc" class="form-control" type="text" value="{$smarty.post.telNoCc}" id="telNoCc" size="3" maxlength="3" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.clientareaphonenumber}</strong></td>
						<td><input name="telNo" class="form-control" type="text" value="{$smarty.post.telNo}" id="telNo" size="10" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_clientareafaxnumberprefix}</strong></td>
						<td><input name="faxNoCc" class="form-control" type="text" value="{$smarty.post.faxNoCc}" id="faxNoCc" size="3" maxlength="3" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_clientareafaxnumber}</strong></td>
						<td><input name="faxNo" class="form-control" type="text" value="{$smarty.post.faxNo}" id="faxNo" size="10" /></td>
					</tr>
					{if $contactproductkey eq "dotnl"}
					<tr>
						<td><strong>{$LANG.rcdom_nltldlegalform}</strong></td>
						<td>{$dotnldropdown}</td>
					</tr>
					{/if}
					{if $contactproductkey eq "dotpro"}
					<tr>
						<td><strong>{$LANG.rcdom_profession}</strong></td>
						<td>{$dotprodropdown}</td>
					</tr>
					{/if}
					{if $contactproductkey eq "domus"}
					<tr>
						<td><strong>{$LANG.rcdom_ustldnexuscat}</strong></td>
						<td>{$domusdropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_ustldapppurpose}</strong></td>
						<td>{$uspurposedropdown}</td>
					</tr>
					{/if}
					{if $contactproductkey eq "dotca"}
					<tr>
						<td><strong>{$LANG.rcdom_catldlegaltype}</strong></td>
						<td>{$calegaltypedropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_catldciraagreement}</strong></td>
						<td>
							<div style="border:#CCCCCC solid 1px;width:480px;height:200px;overflow:scroll;">{$ciragreement}</div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="attrvalue2" value="{$ciraver}" />
							<input name="attrvalue3" type="checkbox" value="y" id="attrvalue3" />
						</td>
						<td>{$LANG.rcdom_catldciraagreementyn}</td>
					</tr>
					{/if}
					{if $contactproductkey eq "dotes"}
					<tr>
						<td><strong>{$LANG.rcdom_estldlegalentitytype}</strong></td>
						<td>{$eslegaltypedropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_estldidformtype}</strong></td>
						<td>{$estldidformtypedropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_estldidformnum}</strong></td>
						<td><input name="attrvalue3" class="form-control" type="text" value="{$smarty.post.attrvalue3}" id="attrvalue3" size="10" /></td>
					</tr>
					{/if}
					{if $contactproductkey eq "dotasia"}
					<tr>
						<td><strong>{$LANG.rcdom_asialegalcountry}</strong></td>
						<td>{$asialocalitydropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_asialegalentitytype}</strong></td>
						<td>{$asialegaltypedropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_asiaidentform}</strong></td>
						<td>{$asiaidentformdropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_asiaidentnumber}</strong></td>
						<td><input name="attrvalue4" class="form-control" type="text" value="{$smarty.post.attrvalue4}" id="attrvalue4" size="10" /></td>
					</tr>
					{/if}
					{if $contactproductkey eq "dotjobs"}
					<tr>
						<td><strong>{$LANG.rcdom_jobscompcontacttitle}</strong></td>
						<td><input name="attrvalue1" class="form-control" type="text" value="{$smarty.post.attrvalue1}" id="attrvalue1" size="10" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_jobscompwebsite}</strong></td>
						<td><input name="attrvalue2" class="form-control" type="text" value="{$smarty.post.attrvalue2}" id="attrvalue2" size="10" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_jobstypeclass}</strong></td>
						<td><input name="attrvalue3" class="form-control" type="text" value="{$smarty.post.attrvalue3}" id="attrvalue3" size="10" /></td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_jobsadmincontact}</strong></td>
						<td>{$jobsadmindropdown}</td>
					</tr>
					<tr>
						<td><strong>{$LANG.rcdom_jobsassocmember}</strong></td>
						<td>{$jobsmemberdropdown}</td>
					</tr>
					{/if}				
					<tr>
						<td colspan="2">
							<input type="hidden" name="productkey" value="{$contactproductkey}"/>
							<input type="hidden" name="irtprule" value="{$irtprule}"/>
							<input type="hidden" name="tab" value="createcontact"/>
							<input type="hidden" name="request" value="docreate"/>
							<input type="hidden" name="contacttype" value="{$contacttype}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<input type="hidden" name="contactId" value="{$smarty.request.contactId}"/>
							<p align="center"><input class="btn btn-success" type="submit" value="{$LANG.rcdom_contactinfocreatebutton}" ></p>
						</td>
					</tr>
				</table>
			</form>
		{else}
			<div class="alert alert-warning">
				{$LANG.rcdom_nocontactcreate}<br />
			</div>
		{/if}
	</div>
</div>