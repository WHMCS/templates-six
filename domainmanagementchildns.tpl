{include file="$template/includes/alert.tpl" type="info" msg=$LANG.domainregisternsexplanation}

<script language="javascript" type="text/javascript">
	function confirmDelete(){literal}{{/literal}return confirm("{$LANG.rcdom_childnsdeletewarn}");{literal}}{/literal}
</script>

{if $modifydnshosterror}
	<br />
	<div class="alert alert-danger">
		<p>{$LANG.clientareaerrors}</p>
		<ul>
			{$modifydnshosterror}
		</ul>
	</div>
{/if}

{if $modifydnshostsuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			{$modifydnshostsuccess}
		</ul>
	</div>
{/if}

{if $modifydnsiperror}
	<br />
	<div class="alert alert-danger">
		<p>{$LANG.clientareaerrors}</p>
		<ul>
			{$modifydnsiperror}
		</ul>
	</div>
{/if}

{if $modifydnsipsuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			{$modifydnsipsuccess}
		</ul>
	</div>
{/if}

{if $deletednshosterror}
	<br />
	<div class="alert alert-danger">
		<p>{$LANG.clientareaerrors}</p>
		<ul>
			{$deletednshosterror}
		</ul>
	</div>
{/if}

{if $deletednshostsuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			{$deletednshostsuccess}
		</ul>
	</div>
{/if}

{if $addchildnserror}
	<br />
	<div class="alert alert-danger">
		<p>{$LANG.clientareaerrors}</p>
		<ul>
			{$addchildnserror}
		</ul>
	</div>
{/if}

{if $addchildnssuccess}
	<br />
	<div class="alert alert-success">
		<p>{$LANG.moduleactionsuccess}</p>
		<ul>
			{$addchildnssuccess}
		</ul>
	</div>
{/if}

<form method="post" action="domainmanagement.php?action=childns">
	<input type="hidden" name="addregchildns" value="true"/>
	<input type="hidden" name="domainid" value="{$domainid}"/>
	<input type="hidden" name="domain" value="{$domain}"/>
	<table class="table table-bordered table-hover">
		<tr>
			<td class="textcenter"  colspan="2">
				<h3>{$LANG.rcdom_newregisterns}</h3>
			</td>
		</tr>
		<tr>
			<td>{$LANG.rcdom_dnsnametitle}:</td>
			<td>
				<div class="input-group">
					<input name="cnsname" class="form-control" type="text" value="{$smarty.post.cnsname}" size="10"/>
					<span class="input-group-addon" id="basic-addon2">.{$domain}</span>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				{$LANG.rcdom_dnsiptitle}:
			</td>
			<td>
				<input name="cnsip" class="form-control" type="text" value="{$smarty.post.cnsip}" size="15"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="{$LANG.rcdom_regcnsbutton}" class="btn btn-success"/>
			</td>
		</tr>
	</table>
</form>

<br/>

{if !empty($childnsarray.dns0.0)}

<table class="table table-bordered table-hover">
	<tr>
		<td class="textcenter"  colspan="2"><h3>{$LANG.rcdom_registeredchildnstitle}</h3></td>
	</tr>
	{foreach key=dnskey item=dnsname from=$childnsarray}
		<tr>
			<td width="50%" valign="top">
				<strong>{$LANG.rcdom_changenshostnametitle}</strong>
				<p>{$LANG.rcdom_changenshostnamedesc}</p>
				<div class="input-group">
					<form method="post" action="domainmanagement.php?action=childns">
						<input type="hidden" name="modifydnshost" value="true"/>
						<input type="hidden" name="oldcns" value="{$dnsname.0}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<div class="col-lg-12">
							<div class="input-group">						
								<input name="newcns" type="text" class="form-control"  value="{$dnsname.0}" size="25"/>
								<span class="input-group-btn">
									<button name="submit" type="submit" class="btn btn-success">{$LANG.rcdom_modcnsbutton}</button>
								</span>
							</div>
						</div>
					</form>
				</div>
			</td>
			<td width="50%" valign="top">
				{foreach key=ipkey item=dnsip from=$dnsname.1}
					<strong>{$LANG.rcdom_changenshostiptitle}</strong>
					<p>{$LANG.rcdom_changenshostipdesc}</p>
					<div class="input-group">
						<form method="post" action="domainmanagement.php?action=childns">
							<input type="hidden" name="modifydnsip" value="true"/>
							<input type="hidden" name="currentcns" value="{$dnsname.0}"/>
							<input type="hidden" name="oldip" value="{$dnsip}"/>
							<input type="hidden" name="domainid" value="{$domainid}"/>
							<input type="hidden" name="domain" value="{$domain}"/>
							<div class="col-lg-12">
								<div class="input-group">						
									<input class="form-control"  name="newip" type="text" value="{$dnsip}" size="15"/>
									<span class="input-group-btn">
										<button class="btn btn-success" type="submit">{$LANG.rcdom_modcnsipbutton}</button>
									</span>
								</div>
							</div>
						</form>
					</div>
					<br />
					<strong>{$LANG.rcdom_deletednsiptitle}</strong>
					<p>{$LANG.rcdom_deletednsipdesc}</p>
					<form method="post" action="domainmanagement.php?action=childns">
						<input type="hidden" name="delregchildns" value="true"/>
						<input type="hidden" name="currentcns" value="{$dnsname.0}"/>
						<input type="hidden" name="currentip" value="{$dnsip}"/>
						<input type="hidden" name="domainid" value="{$domainid}"/>
						<input type="hidden" name="domain" value="{$domain}"/>
						<p align="left"><input class="btn btn-danger" type="submit" value="{$LANG.rcdom_delcnsbutton}" onclick="return confirmDelete();" /></p>
					</form>
				{/foreach}
			</td>
		</tr>
	{/foreach}
</table>

{/if}