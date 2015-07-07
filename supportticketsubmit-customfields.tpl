{foreach from=$customfields item=customfield}
    <div class="form-group">
        <label for="customfield{$customfield.id}">{$customfield.name}</label>
        {$customfield.input}
        {if $customfield.description}
            <p class="help-block">{$customfield.description}</p>
        {/if}
    </div>
{/foreach}
