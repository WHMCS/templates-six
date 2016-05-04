{if in_array('state', $optionalFields)}
    <script>
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

{if $registrationDisabled}
    {include file="$template/includes/alert.tpl" type="error" msg=$LANG.registerCreateAccount|cat:' <strong><a href="cart.php" class="alert-link">'|cat:$LANG.registerCreateAccountOrder|cat:'</a></strong>'}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if !$registrationDisabled}

    <form method="post" class="using-password-strength" action="{$smarty.server.PHP_SELF}" role="form">
        <input type="hidden" name="register" value="true"/>

        <div class="row">

            <div class="col-md-6">
                <div class="form-group">
                    <label for="firstname" class="control-label">{$LANG.clientareafirstname}</label>
                    <input type="text" name="firstname" id="firstname" value="{$clientfirstname}" class="form-control" {if !in_array('firstname', $optionalFields)}required{/if} />
                </div>

                <div class="form-group">
                    <label for="lastname" class="control-label">{$LANG.clientarealastname}</label>
                    <input type="text" name="lastname" id="lastname" value="{$clientlastname}" class="form-control" {if !in_array('lastname', $optionalFields)}required{/if} />
                </div>

                <div class="form-group">
                    <label for="companyname" class="control-label">{$LANG.clientareacompanyname}</label>
                    <input type="text" name="companyname" id="companyname" value="{$clientcompanyname}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label for="email" class="control-label">{$LANG.clientareaemail}</label>
                    <input type="email" name="email" id="email" value="{$clientemail}" class="form-control"/>
                </div>

                <div id="newPassword1" class="form-group has-feedback">
                    <label for="inputNewPassword1" class="control-label">{$LANG.clientareapassword}</label>
                    <input type="password" class="form-control" id="inputNewPassword1" name="password" autocomplete="off" />
                    <span class="form-control-feedback glyphicon glyphicon-password"></span>
                    {include file="$template/includes/pwstrength.tpl"}
                </div>
                <div id="newPassword2" class="form-group has-feedback">
                    <label for="inputNewPassword2" class="control-label">{$LANG.clientareaconfirmpassword}</label>
                    <input type="password" class="form-control" id="inputNewPassword2" name="password2" autocomplete="off" />
                    <span class="form-control-feedback glyphicon glyphicon-password"></span>
                    <div id="inputNewPassword2Msg">
                    </div>
                </div>
            </div>
            <div class="col-md-6">

                <div class="form-group">
                    <label for="address1" class="control-label">{$LANG.clientareaaddress1}</label>
                    <input type="text" name="address1" id="address1" value="{$clientaddress1}" class="form-control" {if !in_array('address1', $optionalFields)}required{/if} />
                </div>

                <div class="form-group">
                    <label for="address2" class="control-label">{$LANG.clientareaaddress2}</label>
                    <input type="text" name="address2" id="address2" value="{$clientaddress2}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label for="city" class="control-label">{$LANG.clientareacity}</label>
                    <input type="text" name="city" id="city" value="{$clientcity}" class="form-control" {if !in_array('city', $optionalFields)}required{/if} />
                </div>

                <div class="form-group">
                    <label for="state" class="control-label">{$LANG.clientareastate}</label>
                    <input type="text" name="state" id="state" value="{$clientstate}" class="form-control" {if !in_array('state', $optionalFields)}required{/if} />
                </div>

                <div class="form-group">
                    <label for="postcode" class="control-label">{$LANG.clientareapostcode}</label>
                    <input type="text" name="postcode" id="postcode" value="{$clientpostcode}" class="form-control" {if !in_array('postcode', $optionalFields)}required{/if} />
                </div>

                <div class="form-group">
                    <label for="country" class="control-label">{$LANG.clientareacountry}</label>
                    <select id="country" name="country" class="form-control">
                        {foreach $clientcountries as $countryCode => $countryName}
                            <option value="{$countryCode}"{if (!$clientcountry && $countryCode eq $defaultCountry) || ($countryCode eq $clientcountry)} selected="selected"{/if}>
                                {$countryName}
                            </option>
                        {/foreach}
                    </select>
                </div>

                <div class="form-group">
                    <label for="phonenumber" class="control-label">{$LANG.clientareaphonenumber}</label>
                    <input type="tel" name="phonenumber" id="phonenumber" value="{$clientphonenumber}" class="form-control" {if !in_array('phonenumber', $optionalFields)}required{/if} />
                </div>

                {if $customfields}
                    {foreach from=$customfields key=num item=customfield}
                        <div class="form-group">
                            <label class="control-label" for="customfield{$customfield.id}">{$customfield.name}</label>
                            <div class="control">
                                {$customfield.input} {$customfield.description}
                            </div>
                        </div>
                    {/foreach}
                {/if}

                {if $currencies}
                    <div class="form-group">
                        <label for="currency" class="control-label">{$LANG.choosecurrency}</label>
                        <select id="currency" name="currency" class="form-control">
                            {foreach from=$currencies item=curr}
                            <option value="{$curr.id}"{if !$smarty.post.currency && $curr.default || $smarty.post.currency eq $curr.id } selected{/if}>{$curr.code}</option>
                            {/foreach}
                        </select>
                    </div>
                {/if}
            </div>
        </div>

        {if $securityquestions}
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">{$LANG.clientareasecurityquestion}:</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group col-sm-12">
                        <select name="securityqid" id="securityqid" class="form-control">
                            {foreach key=num item=question from=$securityquestions}
                                <option value={$question.id}>{$question.question}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" for="securityqans">{$LANG.clientareasecurityanswer}</label>
                        <div class="col-sm-6">
                            <input type="password" name="securityqans" id="securityqans" class="form-control" autocomplete="off" />
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        {include file="$template/includes/captcha.tpl"}

        {if $accepttos}
            <div class="panel panel-danger tospanel">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="fa fa-exclamation-triangle tosicon"></span> &nbsp; {$LANG.ordertos}</h3>
                </div>
                <div class="panel-body">
                        <div class="col-md-12">
                            <label class="checkbox">
                            <input type="checkbox" name="accepttos" class="accepttos">
                            {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
                            </label>
                        </div>
                </div>
            </div>
        {/if}

        <p align="center">
            <input class="btn btn-large btn-primary" type="submit" value="{$LANG.clientregistertitle}"/>
        </p>

    </form>

{/if}
