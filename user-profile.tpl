{include file="$template/includes/flashmessage.tpl"}

<h2>Profile</h2>

<form method="post" action="{routePath('user-profile-save')}">
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label for="inputFirstName" class="control-label">
                    {$LANG.clientareafirstname}
                </label>
                <input type="text" name="firstname" id="inputFirstName" value="{$user->firstName}" class="form-control">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label for="inputLastName" class="control-label">
                    {$LANG.clientarealastname}
                </label>
                <input type="text" name="lastname" id="inputLastName" value="{$user->lastName}" class="form-control">
            </div>
        </div>
    </div>
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
        <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
    </div>
</form>

<br>

<h2>Change Email Address</h2>

<p>
    {if $user->needsToCompleteEmailVerification()}
        <span class="label label-default">Email Not Verified</span>
    {elseif $user->emailVerified()}
        <span class="label label-success">Email Verified</span>
    {/if}
</p>

<form method="post" action="{routePath('user-profile-email-save')}">
    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <label for="inputEmail" class="control-label">
                    {$LANG.clientareaemail}
                </label>
                <input type="email" name="email" id="inputEmail" value="{$user->email}" class="form-control">
            </div>
        </div>
    </div>
    <div class="form-group">
        <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
        <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
    </div>
</form>
