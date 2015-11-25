<h3>{$LANG.domaincontactinfo}</h3>

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.whoisContactWarning}

{if $successful}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
{/if}

{if $error}
    {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
{/if}

<form method="post" action="{$smarty.server.PHP_SELF}?action=domaincontacts">

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
                        <label>{$name}</label>
                        <input type="text" name="contactdetails[{$contactdetail}][{$name}]" value="{$value}" class="form-control {$contactdetail}customwhois" />
                    </div>
                {/foreach}

            </div>

        {/foreach}

    </div>

    <br />

    <p class="text-center">
        <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" />
        <input type="reset" value="{$LANG.clientareacancel}" class="btn btn-default" />
    </p>

</form>

