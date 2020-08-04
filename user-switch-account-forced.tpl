<div class="continue-container">
    <p>{lang key="switchAccount.forcedSwitchRequest"}</p>

    <p>
        <strong>
            {$requiredClient->fullName}
            {if $requiredClient->companyName}
                ({$requiredClient->companyName})
            {/if}
        </strong>
        <br>
        {$requiredClient->email}
    </p>

    <form method="post" action="{routePath('user-accounts')}">
        <input type="hidden" name="id" value="{$requiredClient->id}" >
        <button type="submit" class="btn btn-primary">
            {lang key="continue"}
            <i class="fas fa-arrow-right"></i>
        </button>
        <a href="{routePath('clientarea-home')}">{lang key="switchAccount.cancelAndReturn"}</a>
    </form>
</div>
