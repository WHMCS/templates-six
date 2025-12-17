<textarea class="form-control config-field-input"
          id="config_{$field.name}"
          name="config[{$field.name}]"
          rows="3"
          placeholder="{$field.placeholder|default:''}">{if $configFieldValues[$field.name]}{$configFieldValues[$field.name]}{/if}</textarea>
