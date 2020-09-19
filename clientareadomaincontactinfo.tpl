<h3>{$LANG.domaincontactinfo}</h3>

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.whoisContactWarning}

{if $successful}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
{/if}

{if $pending}
    {include file="$template/includes/alert.tpl" type="info" msg=$pendingMessage textcenter=true}
{/if}

{if $domainInformation && !$pending && $domainInformation->getIsIrtpEnabled() && $domainInformation->isContactChangePending()}
    {if $domainInformation->getPendingSuspension()}
        {include file="$template/includes/alert.tpl" type="warning" msg="<strong>{$LANG.domains.verificationRequired}</strong><br>{$LANG.domains.newRegistration}" textcenter=true}
    {else}
        {include file="$template/includes/alert.tpl" type="info" msg="<strong>{$LANG.domains.contactChangePending}</strong><br>{$LANG.domains.contactsChanged}" textcenter=true}
    {/if}
{/if}

{if $error}
    {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts" id="frmDomainContactModification">

    <input type="hidden" name="sub" value="save" />
    <input type="hidden" name="domainid" value="{$domainid}" />

    <div class="row">

        {foreach from=$contactdetails name=contactdetails key=contactdetail item=values}

            <div class="col-md-6">

                <h4>{$contactdetail} {$LANG.supportticketscontact}</h4>

                <div class="radio">
                    <label>
                        <input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}1" value="contact" onclick="useDefaultWhois(this.id)" />
                        {$LANG.domaincontactusexisting}
                    </label>
                </div>

                <div class="row">
                    <div class="col-xs-offset-1 col-xs-10">
                        <div class="form-group">
                            <label for="{$contactdetail}3">{$LANG.domaincontactchoose}</label>
                            <input type="hidden" name="sel[{$contactdetail}]" value="">
                            <select id="{$contactdetail}3" class="form-control {$contactdetail}defaultwhois" name="sel[{$contactdetail}]" disabled>
                                <option value="u{$clientsdetails.userid}">{$LANG.domaincontactprimary}</option>
                                {foreach key=num item=contact from=$contacts}
                                    <option value="c{$contact.id}">{$contact.name}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </div>

                <div class="radio">
                    <label>
                        <input type="radio" name="wc[{$contactdetail}]" id="{$contactdetail}2" value="custom" onclick="useCustomWhois(this.id)" checked />
                        {$LANG.domaincontactusecustom}
                    </label>
                </div>

                {foreach key=name item=value from=$values}
                    <div class="form-group">
                        <label>{$contactdetailstranslations[$name]}</label>
                        <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" data-original-value="{$value}" class="form-control {$contactdetail}customwhois{if array_key_exists($contactdetail, $irtpFields) && in_array($name, $irtpFields[$contactdetail])} irtp-field{/if}" />
                    </div>
                {/foreach}

            </div>

        {/foreach}

    </div>

    <br />

    <p class="text-center">
        {if $domainInformation && $irtpFields}
            <input id="irtpOptOut" type="hidden" name="irtpOptOut" value="0">
            <input id="irtpOptOutReason" type="hidden" name="irtpOptOutReason" value="">
        {/if}
        <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
        <input type="reset" value="{$LANG.clientareacancel}" class="btn btn-default" />
    </p>

</form>
{if $domainInformation && $irtpFields}
    <script type="text/javascript">
        var allowSubmit = 0;
    </script>
    <div class="modal fade" id="modalIRTPConfirmation" role="dialog" aria-labelledby="IRTPConfirmationLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content panel panel-primary">
                <div id="modalIRTPConfirmationHeading" class="modal-header panel-heading">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">{lang key='orderForm.close'}</span>
                    </button>
                    <h4 class="modal-title" id="IRTPConfirmationLabel">{lang key='domains.importantReminder'}</h4>
                </div>
                <div id="modalIRTPConfirmationBody" class="modal-body panel-body text-center">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            {lang key='domains.irtpNotice'}
                        </div>
                        <div class="col-sm-12">
                            <div class="checkbox-inline">
                                <label for="modalIrtpOptOut">
                                    <input id="modalIrtpOptOut" class="checkbox" type="checkbox" value="1">
                                    {lang key='domains.optOut'}
                                </label>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-sm-12 text-left">
                                    <label for="modalReason">{lang key='domains.optOutReason'}</label>:
                                </div>
                                <div class="col-sm-12">
                                    <input id="modalReason" type="text" class="form-control input-600" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="modalIRTPConfirmationFooter" class="modal-footer panel-footer">
                    <button type="button" id="IRTPConfirmation-Submit" class="btn btn-primary" onclick="irtpSubmit();return false;">
                        {lang key='supportticketsticketsubmit'}
                    </button>
                    <button type="button" id="IRTPConfirmation-Cancel" class="btn btn-default" data-dismiss="modal">
                        {lang key='cancel'}
                    </button>
                </div>
            </div>
        </div>
    </div>
{/if}

