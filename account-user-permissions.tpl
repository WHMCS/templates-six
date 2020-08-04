<h2>{lang key="userManagement.managePermissions"}</h2>

<p>{$user->email}</p>

<h3>{lang key="userManagement.permissions"}</h3>

<form method="post" action="{routePath('account-users-permissions-save', $user->id)}">

    {foreach $permissions as $permission}
        <label class="checkbox-inline">
            <input type="checkbox" name="perms[{$permission.key}]" value="1"{if $userPermissions->hasPermission($permission.key)} checked{/if}>
            {$permission.title}
            -
            {$permission.description}
        </label>
        <br>
    {/foreach}

    <br>

    <p>
        <button type="submit" class="btn btn-primary">
            {lang key="clientareasavechanges"}
        </button>
        <a href="{routePath('account-users')}" class="btn btn-default">
            {lang key="clientareacancel"}
        </a>
    </p>

</form>
