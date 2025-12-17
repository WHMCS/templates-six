{if $shouldDisplayUpgradeButton}
    {include file="$template/store/dynamic-service/partials/upgrade-button.tpl"}
{/if}

<div id="js-global-command-result" class="mb-3"></div>

<div class="row">
    {foreach from=$commands item=command name=cmds}
        <div class="col-md-6 mb-4">
            <form method="post"
                  action="{routePath('marketconnect-service-command-execute', $service_group_slug, $command->key)}"
                  class="js-service-command-form card h-100">

                <div class="card-header">
                    <strong>{$command->label}</strong>
                </div>

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
                            </div>
                        {/foreach}
                    {/if}
                </div>

                <div class="card-footer text-right">
                    <button type="submit" class="btn btn-primary">
                        {$command->label}
                    </button>
                    <div class="mt-2 js-command-result"></div>
                </div>
            </form>
        </div>
    {/foreach}
</div>
