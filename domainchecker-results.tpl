{if $validDomain}

    {if $searchResults}
        <div class="domain-checker-result-headline">
            {if $searchResults.isRegistered}
                <p class="domain-checker-unavailable">
                    {$LANG.domainunavailable1} <strong>{$searchResults.domainName}</strong> {$LANG.domainunavailable2}
                </p>
            {elseif $searchResults.status == 'reserved'}
                <p class="domain-checker-available">
                    {$LANG.domainreserved1} <strong>{$searchResults.domainName}</strong> {$LANG.domainreserved2}
                </p>
            {else}
                <p class="domain-checker-available">
                    {$LANG.domainavailable1} <strong>{$searchResults.domainName}</strong> {$LANG.domainavailable2}
                </p>
            {/if}
        </div>
    {/if}

    {if ($searchResults && !$searchResults.isRegistered) || $bulkCheckResults}

        <div class="domainresults" id="primarySearchResults">
            <div id="btnCheckout" class="domain-checkout-area">
                <a href="cart.php?a=view" class="btn btn-default">{$LANG.domainsgotocheckout} &raquo;</a>
            </div>
            <div>
                {$LANG.domainssearchresults}
            </div>
            <table class="table table-curved table-hover" id="searchResults">
                <tbody>
                    {if $searchResults}
                        <tr>
                            <td><strong>{$searchResults.domainName}</strong></td>
                            <td class="text-center">
                                {if $searchResults.status == 'reserved'}
                                    <span class="label label-success">{$LANG.domainreserved}</span>
                                {else}
                                    <span class="label label-success">{$LANG.domaincheckeravailable}</span>
                                {/if}
                            </td>
                            <td class="text-center">
                                {$searchResults.shortestPeriod.register}
                            </td>
                            <td class="text-center">
                                {if count($searchResults.pricing) == 1}
                                    <button type="button" onclick="addToCart(this, false, 'register')" class="btn btn-primary btn-sm">
                                        <span class="glyphicon glyphicon-shopping-cart"></span>
                                        {$LANG.addtocart}
                                    </button>
                                {else}
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-primary btn-sm" onclick="addToCart(this, false, 'register')">
                                            <b class="glyphicon glyphicon-shopping-cart"></b>
                                            {$LANG.addtocart}
                                        </button>
                                        <button type="button" class="btn btn-primary btn-sm dropdown-toggle additional-options" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <b class="caret"></b>
                                            <span class="sr-only">
                                                {lang key="domainChecker.additionalPricingOptions" domain=$searchResults.domainName}
                                            </span>
                                        </button>
                                        <ul class="dropdown-menu" role="menu">
                                            {foreach $searchResults.pricing as $years => $price}
                                                {if $price@iteration eq 1}
                                                    {* Don't output the first as this is default *}
                                                    {continue}
                                                {/if}
                                                <li>
                                                    <a onclick="addToCart(this, false, 'register', {$years});return false;">
                                                        {$years} {$LANG.orderyears} @ {$price.register}
                                                    </a>
                                                </li>
                                            {/foreach}
                                        </ul>
                                    </div>
                                {/if}
                            </td>
                        </tr>
                    {/if}
                    {foreach $bulkCheckResults as $result}
                        <tr>
                            <td><strong>{$result.domainName}</strong></td>
                            <td class="text-center">
                                {if $searchingFor == 'register'}
                                    {if $result.isAvailable}
                                        {if $result.status == 'reserved'}
                                            <span class="label label-success">{$LANG.domainreserved}</span>
                                        {else}
                                            <span class="label label-success">{$LANG.domaincheckeravailable}</span>
                                        {/if}
                                    {elseif $result.isRegistered}
                                        <span class="label label-danger">{$LANG.domaincheckertaken}</span>
                                    {else}
                                        <span class="label label-danger">Status Unknown</span>
                                    {/if}
                                {else}
                                    {if $result.isRegistered}
                                        <span class="label label-success">{$LANG.domaincheckertransferable}</span>
                                    {elseif $result.isAvailable}
                                        <span class="label label-danger">Not Registered</span>
                                    {else}
                                        <span class="label label-danger">Status Unknown</span>
                                    {/if}
                                {/if}
                            </td>
                            <td class="text-center">
                                {if ($searchingFor == 'register' && $result.isAvailable)}
                                    {$result.shortestPeriod.register}
                                {elseif ($searchingFor == 'transfer' && $result.isRegistered)}
                                    {$result.shortestPeriod.transfer}
                                {/if}
                            </td>
                            <td class="text-right">
                                {if ($searchingFor == 'register' && $result.isAvailable)}
                                    {if count($result.pricing) == 1}
                                        <button type="button" onclick="addToCart(this, false, 'register')" class="btn btn-primary btn-sm">
                                            <span class="glyphicon glyphicon-shopping-cart"></span>
                                            {$LANG.addtocart}
                                        </button>
                                    {else}
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary btn-sm" onclick="addToCart(this, false, 'register')">
                                                <b class="glyphicon glyphicon-shopping-cart"></b>
                                                {$LANG.addtocart}
                                            </button>
                                            <button type="button" class="btn btn-primary btn-sm dropdown-toggle additional-options" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <b class="caret"></b>
                                            <span class="sr-only">
                                                {lang key="domainChecker.additionalPricingOptions" domain=$result.domainName}
                                            </span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                {foreach $result.pricing as $years => $price}
                                                    {if $price@iteration eq 1}
                                                        {* Don't output the first as this is default *}
                                                        {continue}
                                                    {/if}
                                                    <li>
                                                        <a onclick="addToCart(this, false, 'register', {$years});return false;">
                                                            {$years} {$LANG.orderyears} @ {$price.register}
                                                        </a>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    {/if}
                                {elseif ($searchingFor == 'transfer' && $result.isRegistered)}
                                    <button type="button" onclick="addToCart(this, false, 'transfer')" class="btn btn-primary btn-sm">
                                        <span class="glyphicon glyphicon-shopping-cart"></span>
                                        {$LANG.addtocart}
                                    </button>
                                {elseif $result.isRegistered}
                                    <a href="http://{$result.domainName}" target="_blank" class="btn btn-default btn-sm">www</a>
                                    <button type="button" onclick="viewWhois('{$result.domainName}')" class="btn btn-default btn-sm">WHOIS</button>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    {/if}
{/if}
{if $searchResults && count($searchResults.suggestions) > 0}
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="domainresults" id="suggestionSearchResults">
                <div>
                    {$LANG.domainssuggestions} <span>{$LANG.domainsothersuggestions}</span>
                </div>
                <table class="table table-curved table-hover" id="suggestionResults">
                    <tbody>
                        {foreach $searchResults.suggestions as $i => $result}
                            <tr{if $i >= 10} class="hidden"{/if}>
                                <td>
                                    <strong>{$result.domainName}</strong>
                                </td>
                                <td class="text-center">
                                    {$result.shortestPeriod.register}
                                </td>
                                <td class="text-right">
                                    {if count($result.pricing) == 1}
                                        <button type="button" onclick="addToCart(this, true, 'register')" class="btn btn-default btn-sm">
                                            <span class="glyphicon glyphicon-shopping-cart"></span>
                                            {$LANG.addtocart}
                                        </button>
                                    {else}
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-default btn-sm" onclick="addToCart(this, true, 'register')">
                                                <b class="glyphicon glyphicon-shopping-cart"></b>
                                                {$LANG.addtocart}
                                            </button>
                                            <button type="button" class="btn btn-default btn-sm dropdown-toggle additional-options" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <b class="caret"></b>
                                            <span class="sr-only">
                                                {lang key="domainChecker.additionalPricingOptions" domain=$result.domainName}
                                            </span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                {foreach $result.pricing as $years => $price}
                                                    {if $price@iteration eq 1}
                                                        {* Don't output the first as this is default *}
                                                        {continue}
                                                    {/if}
                                                    <li>
                                                        <a onclick="addToCart(this, true, 'register', {$years});return false;">
                                                            {$years} {$LANG.orderyears} @ {$price.register}
                                                        </a>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                        <tr id="trNoMoreSuggestions" class="hidden">
                            <td colspan="3" class="text-muted text-center">
                                {$LANG.domaincheckernomoresuggestions}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            {if $moreSuggestionsAvailable}
                <p class="text-center">
                    <a href="#" class="btn btn-link" id="btnMoreSuggestions" onclick="showMoreSuggestions();return false">{$LANG.domainsmoresuggestions}</a>
                </p>
            {/if}
            <div class="domain-disclaimer-area">
                <p class="text-muted"><strong>{$LANG.disclaimers}</strong><br />{$LANG.domainssuggestionswarnings}</p>
            </div>
        </div>
    </div>

{/if}
