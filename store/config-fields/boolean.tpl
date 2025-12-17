<div class="form-check">
    <input type="checkbox"
           class="form-check-input config-field-input"
           id="config_{$field.name}"
           name="config[{$field.name}]"
           value="1"{if $configFieldValues[$field.name]} checked{/if}>
    <label class="form-check-label" for="config_{$field.name}">
        {$field.description|default:'Enable this option.'}
    </label>
</div>
