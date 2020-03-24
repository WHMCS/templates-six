{if $contactid}

    {if $successful}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}

    <script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

    <div class="alert alert-block alert-info">
        <form class="form-horizontal" role="form" method="post" action="{$smarty.server.PHP_SELF}?action=contacts">
            <div class="row">
                <label for="inputContactId" class="col-sm-3 control-label">{$LANG.clientareachoosecontact}</label>
                <div class="col-sm-6">
                    <select name="contactid" id="inputContactId" onchange="submit()" class="form-control">
                        {foreach item=contact from=$contacts}
                            <option value="{$contact.id}"{if $contact.id eq $contactid} selected="selected"{/if}>{$contact.name} - {$contact.email}</option>
                        {/foreach}
                        <option value="new">{$LANG.clientareanavaddcontact}</option>
                    </select>
                </div>
                <div class="col-sm-2 hidden-xs">
                    <button type="submit" class="btn btn-default btn-block">{$LANG.go}</button>
                </div>
            </div>
        </form>
    </div>

    <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=contacts&id={$contactid}">
        <input type="hidden" name="submit" value="true" />

        <div class="row">
            <div class="col-sm-6">

                <div class="form-group">
                    <label for="inputFirstName" class="control-label">{$LANG.clientareafirstname}</label>
                    <input type="text" name="firstname" id="inputFirstName" value="{$contactfirstname}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputLastName" class="control-label">{$LANG.clientarealastname}</label>
                    <input type="text" name="lastname" id="inputLastName" value="{$contactlastname}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputCompanyName" class="control-label">{$LANG.clientareacompanyname}</label>
                    <input type="text" name="companyname" id="inputCompanyName" value="{$contactcompanyname}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputEmail" class="control-label">{$LANG.clientareaemail}</label>
                    <input type="email" name="email" id="inputEmail" value="{$contactemail}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputPhone" class="control-label">{$LANG.clientareaphonenumber}</label>
                    <input type="tel" name="phonenumber" id="inputPhone" value="{$contactphonenumber}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputTaxId" class="control-label">{lang key=$taxIdLabel}</label>
                    <input type="text" name="tax_id" id="inputTaxId" class="form-control" value="{$contactTaxId}" />
                </div>

                <div class="form-group">
                    <label class="control-label" for="inputSubaccountActivate">{$LANG.subaccountactivate}</label>
                    <div class="controls checkbox">
                        <label>
                            <input type="checkbox" name="subaccount" id="inputSubaccountActivate"{if $subaccount} checked{/if} /> {$LANG.subaccountactivatedesc}
                        </label>
                    </div>
                </div>

            </div>
            <div class="col-sm-6 col-xs-12 pull-right">

                <div class="form-group">
                    <label for="inputAddress1" class="control-label">{$LANG.clientareaaddress1}</label>
                    <input type="text" name="address1" id="inputAddress1" value="{$contactaddress1}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputAddress2" class="control-label">{$LANG.clientareaaddress2}</label>
                    <input type="text" name="address2" id="inputAddress2" value="{$contactaddress2}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputCity" class="control-label">{$LANG.clientareacity}</label>
                    <input type="text" name="city" id="inputCity" value="{$contactcity}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputState" class="control-label">{$LANG.clientareastate}</label>
                    <input type="text" name="state" id="inputState" value="{$contactstate}" class="form-control" />
                </div>

                <div class="form-group">
                    <label for="inputPostcode" class="control-label">{$LANG.clientareapostcode}</label>
                    <input type="text" name="postcode" id="inputPostcode" value="{$contactpostcode}" class="form-control" />
                </div>

                <div class="form-group">
                    <label class="control-label" for="country">{$LANG.clientareacountry}</label>
                    {$countriesdropdown}
                </div>

            </div>
        </div>

        <div id="subacct-container" class="well{if !$subaccount} hidden{/if}">

            <div class="form-group">
                <label class="full control-label">{$LANG.subaccountpermissions}</label>
                <div class="checkbox clearfix" id="contactPermissions">
                    {foreach $allPermissions as $permission}
                        <div class="col-sm-6">
                            <label>
                                <input type="checkbox" name="permissions[]" value="{$permission}"{if in_array($permission, $permissions)} checked{/if} />
                                <span>
                                    {assign var='langPermission' value='subaccountperms'|cat:$permission}{$LANG.$langPermission}
                                </span>
                            </label>
                        </div>
                    {/foreach}
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <button type="button" class="btn btn-sm btn-check-all" data-checkbox-container="contactPermissions" data-btn-check-toggle="1" id="btnSelectAll-contactPermissions" data-label-text-select="{lang key='checkAll'}" data-label-text-deselect="{lang key='uncheckAll'}">
                            {lang key='checkAll'}
                        </button>
                    </div>
                </div>
            </div>

            <fieldset class="form-horizontal">
                <div id="newPassword1" class="form-group has-feedback">
                    <label for="inputNewPassword1" class="col-sm-4 control-label">{$LANG.newpassword}</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="inputNewPassword1" name="password" autocomplete="off" />
                        <span class="form-control-feedback glyphicon"></span>
                        {include file="$template/includes/pwstrength.tpl" noDisable=true}
                    </div>
                    <div class="col-sm-3">
                        <button type="button" class="btn btn-default generate-password" data-targetfields="inputNewPassword1,inputNewPassword2">
                            {$LANG.generatePassword.btnLabel}
                        </button>
                    </div>
                </div>
                <div id="newPassword2" class="form-group has-feedback">
                    <label for="inputNewPassword2" class="col-sm-4 control-label">{$LANG.confirmnewpassword}</label>
                    <div class="col-sm-5">
                        <input type="password" class="form-control" id="inputNewPassword2" name="password2" autocomplete="off" />
                        <span class="form-control-feedback glyphicon"></span>
                        <div id="inputNewPassword2Msg">
                        </div>
                    </div>
                </div>
            </fieldset>
            {if $hasLinkedProvidersEnabled}
                <h3>Linked Accounts</h3>
                {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }
            {/if}
        </div>

        <div class="form-group">
            <h3>{$LANG.clientareacontactsemails}</h3>
            <div class="controls checkbox">
                {foreach $emailPreferences as $emailType => $value}
                    <label>
                    <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                    <input type="checkbox" name="email_preferences[{$emailType}]" id="{$emailType}emails" value="1"{if $value} checked="checked"{/if} />
                    {lang key="clientareacontactsemails"|cat:$emailType}
                    </label>{if !($emailType@last)}<br />{/if}
                {/foreach}
            </div>
        </div>

        <div class="form-group text-center">
            <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
            <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
            <a class="btn btn-danger" data-toggle="confirmation" data-btn-ok-label="{lang key='yes'}" data-btn-ok-icon="fas fa-check" data-btn-ok-class="btn-success" data-btn-cancel-label="{lang key='no'}" data-btn-cancel-icon="fas fa-ban" data-btn-cancel-class="btn-default" data-title="{lang key='clientareadeletecontact'}" data-content="{lang key='clientareadeletecontactareyousure'}" data-popout="true" href="clientarea.php?action=contacts&delete=true&id={$contactid}&token={$token}">{lang key='clientareadeletecontact'}</a>
        </div>

    </form>
{else}

    {include file="$template/clientareaaddcontact.tpl"}

{/if}

<script>
    jQuery(document).ready( function ()
    {
        WHMCS.form.register();
        jQuery('.removeAccountLink').click(function (e) {
            e.preventDefault();
            var authUserID = jQuery(this).data('authid');
            swal(
                {
                    title: "Are you sure?",
                    text: "This permanently unlinks the authorized account.",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes, unlink it!",
                    closeOnConfirm: false
                },
                function(){
                    WHMCS.http.jqClient.post('{routePath('auth-manage-client-delete')}' + authUserID,
                        {
                            'token': '" . generate_token("plain") . "'
                        }).done(function(data) {
                        if (data.status == 'success') {
                            jQuery('#remoteAuth' + authUserID).remove();
                            swal("Unlinked!", data.message, "success");
                        } else {
                            swal("Error!", data.message, "error");
                        }
                    });
                });
        });
    });
</script>
