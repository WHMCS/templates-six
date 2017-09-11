{if $linkableProviders }
    <h2>
        {lang key='remoteAuthn.titleLinkedAccounts'}
    </h2>

    {include file="$template/includes/linkedaccounts.tpl" linkContext="clientsecurity" }

    <br>

    {include file="$template/includes/linkedaccounts.tpl" linkContext="linktable" }

    <br>
{/if}

{if $twofaavailable}

    {if $twofaactivation}

        <div id="twofaactivation">
            {$twofaactivation}
        </div>

    {else}

        <h2>{$LANG.twofactorauth}</h2>

        {include file="$template/includes/alert.tpl" type="warning" msg="{lang key="clientAreaSecurityTwoFactorAuthRecommendation"}"}

        <p>
            {$LANG.twofaactivationintro}
        </p>

        <br />

        <form method="post" action="clientarea.php?action=security">
            <input type="hidden" name="2fasetup" value="1" />
            <p align="center">
                {if $twofastatus}
                    <input type="submit" value="{$LANG.twofadisableclickhere}" class="btn btn-danger" />
                {else}
                    <input type="submit" value="{$LANG.twofaenableclickhere}" class="btn btn-success" />
                {/if}
            </p>
        </form>

        <br />
        <br />

    {/if}

{/if}

{if $securityquestionsenabled && !$twofaactivation}

    <h2>{$LANG.clientareanavsecurityquestions}</h2>

    {if $successful}
        {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
    {elseif $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {elseif $nocurrent}
        {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaSecurityNoSecurityQuestions"}"}
    {else}
        {include file="$template/includes/alert.tpl" type="info" msg="{lang key="clientAreaSecuritySecurityQuestionOtherError"}"}
    {/if}

    <form role="form" method="post" action="{$smarty.server.PHP_SELF}?action=security">

        {if !$nocurrent}
        <div class="form-group">
            <label for="inputCurrentAns" class="control-label">{$currentquestion}</label>
            <input type="password" name="currentsecurityqans" id="inputCurrentAns" class="form-control" autocomplete="off" />
        </div>
        {/if}

        <div class="form-group">
            <label for="inputSecurityQid" class="control-label">{$LANG.clientareasecurityquestion}</label>
            <select name="securityqid" id="inputSecurityQid" class="form-control">
                {foreach key=num item=question from=$securityquestions}
                <option value={$question.id}>{$question.question}</option>
                {/foreach}
            </select>
        </div>

        <div class="row">
            <div class="col-md-6">

                <div class="form-group">
                    <label for="inputSecurityAns1" class="control-label">{$LANG.clientareasecurityanswer}</label>
                    <input type="password" name="securityqans" id="inputSecurityAns1" class="form-control" autocomplete="off" />
                </div>

            </div>
            <div class="col-md-6">

                <div class="form-group">
                    <label for="inputSecurityAns2" class="control-label">{$LANG.clientareasecurityconfanswer}</label>
                    <input type="password" name="securityqans2" id="inputSecurityAns2" class="form-control" autocomplete="off" />
                </div>

            </div>
        </div>

        <p class="text-center">
            <input class="btn btn-primary" type="submit" name="submit" value="{$LANG.clientareasavechanges}" />
            <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
        </p>

    </form>

    <br />
    <br />

{/if}

{if $showSsoSetting && !$twofaactivation}

    <h2>{$LANG.sso.title}</h2>

    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.sso.summary}

    <form id="frmSingleSignOn">
        <input type="hidden" name="token" value="{$token}" />
        <input type="hidden" name="action" value="security" />
        <input type="hidden" name="toggle_sso" value="1" />
        <div class="margin-10">
            <input type="checkbox" name="allow_sso" class="toggle-switch-success" id="inputAllowSso"{if $isSsoEnabled} checked{/if}>
            &nbsp;
            <span id="ssoStatusTextEnabled"{if !$isSsoEnabled} class="hidden"{/if}>
                {$LANG.sso.enabled}
            </span>
            <span id="ssoStatusTextDisabled"{if $isSsoEnabled} class="hidden"{/if}>
                {$LANG.sso.disabled}
            </span>
        </div>
    </form>

    <p>{$LANG.sso.disablenotice}</p>

    <br />
    <br />

{/if}
