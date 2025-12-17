<select class="form-control config-field-input"
        id="config_{$field.name}"
        name="config[{$field.name}]{if $field.allow_multiple}[]{/if}"
        {if $field.allow_multiple}multiple{/if}>
    {if !$field.required && !$field.allow_multiple}<option value="">Select an Option</option>{/if}
    {if $field.choices}
        {foreach $field.choices as $value => $label}
            {assign var="isSelected" value=($field.allow_multiple && is_array($configFieldValues[$field.name]) && in_array($value, $configFieldValues[$field.name])) || (!$field.allow_multiple && $configFieldValues[$field.name] == $value)}
            <option value="{$value}"{if $isSelected} selected{/if}>{$label}</option>
        {/foreach}
    {elseif $field.options}
        {foreach $field.options as $option}
            {assign var="isSelected" value=($field.allow_multiple && is_array($configFieldValues[$field.name]) && in_array($option.value, $configFieldValues[$field.name])) || (!$field.allow_multiple && $configFieldValues[$field.name] == $option.value)}
            <option value="{$option.value}"{if $isSelected} selected{/if}>{$option.label}</option>
        {/foreach}
    {/if}
</select>
