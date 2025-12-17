<form method="post" action="{$actionUrl}">
    {$csrfToken}
    <div class="card-body">
        {if $command->description}
            <p class="text-muted">{$command->description}</p>
        {/if}

        {if $command->fields && count($command->fields) > 0}
            {foreach from=$command->fields item=field}
                <div class="form-group">
                    <label for="field_{$command->key}_{$field.name}">
                        {$field.label}
                        {if $field.required}<span class="text-danger">*</span>{/if}
                    </label>

                    {if $field.type == 'select'}
                        {include file="$template/store/config-fields/select.tpl" field=$field}
                    {elseif $field.type == 'textarea'}
                        {include file="$template/store/config-fields/textarea.tpl" field=$field}
                    {elseif $field.type == 'boolean'}
                        {include file="$template/store/config-fields/boolean.tpl" field=$field}
                    {else}
                        {include file="$template/store/config-fields/input.tpl" field=$field}
                    {/if}

                    {if isset($fieldErrors[$field.name])}
                        <div class="alert alert-danger mt-1">
                            {foreach from=$fieldErrors[$field.name] item=err}
                                {$err}<br>
                            {/foreach}
                        </div>
                    {/if}
                </div>
            {/foreach}
        {/if}
    </div>
</form>
