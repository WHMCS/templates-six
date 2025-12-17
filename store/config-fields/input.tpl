<input type="{$field.type}"
       class="form-control config-field-input"
       id="config_{$field.name}"
       name="config[{$field.name}]"
       value="{if $configFieldValues[$field.name]}{$configFieldValues[$field.name]}{/if}"
       placeholder="{if $field.type == 'domain'}example.com{else}{$field.placeholder|default:''}{/if}">
