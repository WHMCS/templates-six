<h3>{$LANG.domainemailforwarding}</h3>

{include file="$template/includes/alert.tpl" type="info" msg=$LANG.domainemailforwardingdesc}

{if $error}
    {include file="$template/includes/alert.tpl" type="error" msg=$error}
{/if}

{if $external}

    <br />
    <br />
    <div class="text-center">
        {$code}
    </div>
    <br /
    ><br />
    <br />
    <br />

{else}

    <form method="post" action="{$smarty.server.PHP_SELF}?action=domainemailforwarding">
        <input type="hidden" name="sub" value="save" />
        <input type="hidden" name="domainid" value="{$domainid}" />

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>{$LANG.domainemailforwardingprefix}</th>
                    <th></th>
                    <th>{$LANG.domainemailforwardingforwardto}</th>
                </tr>
            </thead>
            <tbody>
                {foreach key=num item=emailforwarder from=$emailforwarders}
                <tr>
                    <td><input type="text" name="emailforwarderprefix[{$num}]" value="{$emailforwarder.prefix}" class="form-control" /></td>
                    <td class="text-center">@{$domain} => </td>
                    <td><input type="text" name="emailforwarderforwardto[{$num}]" value="{$emailforwarder.forwardto}" class="form-control" /></td>
                </tr>
                {/foreach}
                <tr>
                    <td><input type="text" name="emailforwarderprefixnew" class="form-control" /></td>
                    <td class="text-center">@{$domain} => </td>
                    <td><input type="text" name="emailforwarderforwardtonew" class="form-control" /></td>
                </tr>
            </tbody>
        </table>

        <p class="text-center">
            <input type="submit" value="{$LANG.clientareasavechanges}" class="btn btn-primary" /> <input type="reset" value="{$LANG.clientareacancel}" class="btn btn-default" />
        </p>

    </form>

{/if}
