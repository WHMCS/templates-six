{if !$loggedin && $currencies}
    <div align="right">
        <form method="post" action="">
            <select name="currency" class="form-control currency-selector" onchange="submit()">
                <option>Change Currency ({$activeCurrency.prefix} {$activeCurrency.code})</option>
                {foreach $currencies as $currency}
                    <option value="{$currency['id']}">{$currency['prefix']} {$currency['code']}</option>
                {/foreach}
            </select>
        </form>
    </div>
{/if}
