{if $invalid}

    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.clientareacancelinvalid textcenter=true}
    <p class="text-center">
        <a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{$LANG.clientareabacklink}</a>
    </p>

{elseif $requested}

    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.clientareacancelconfirmation textcenter=true}

    <p class="text-center">
        <a href="clientarea.php?action=productdetails&amp;id={$id}" class="btn btn-primary">{$LANG.clientareabacklink}</a>
    </p>

{else}

    {if $error}
        {include file="$template/includes/alert.tpl" type="error" errorshtml="<li>{$LANG.clientareacancelreasonrequired}</li>"}
    {/if}

    {include file="$template/includes/alert.tpl" type="info" textcenter=true msg="{$LANG.clientareacancelproduct}: <strong>{$groupname} - {$productname}</strong>{if $domain} ({$domain}){/if}"}

    <form method="post" action="{$smarty.server.PHP_SELF}?action=cancel&amp;id={$id}" class="form-stacked">
        <input type="hidden" name="sub" value="submit" />

        <fieldset>
            <div class="form-group">
                <label for="cancellationreason">{$LANG.clientareacancelreason}</label>
                <textarea name="cancellationreason" id="cancellationreason" class="form-control fullwidth" rows="6"></textarea>
            </div>

            {if $domainid}
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.cancelrequestdomain}</h3>
                </div>
                <div class="panel-body">
                    <p>{$LANG.cancelrequestdomaindesc|sprintf2:$domainnextduedate:$domainprice:$domainregperiod}</p>
                    <div class="col-sm-12 text-center">
                        <label class="checkbox">
                            <input type="checkbox" name="canceldomain" id="canceldomain" /> {$LANG.cancelrequestdomainconfirm}
                        </label>
                    </div>
                </div>
            </div>
            {/if}

            <div class="form-group">
                <div class="form-inline text-center">
                    <label class="control-label" for="type">{$LANG.clientareacancellationtype}</label>
                    <select name="type" id="type" class="form-control">
                        <option value="Immediate">{$LANG.clientareacancellationimmediate}</option>
                        <option value="End of Billing Period">{$LANG.clientareacancellationendofbillingperiod}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="form-inline text-center">
                    <input type="submit" value="{$LANG.clientareacancelrequestbutton}" class="btn btn-danger" />
                    <a href="clientarea.php?action=productdetails&id={$id}" class="btn btn-default">{$LANG.cancel}</a>
                </div>
            </div>

        </fieldset>

    </form>

{/if}
