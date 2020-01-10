<p>{$LANG.metrics.explanation}</p>
<table class="table table-striped" style="margin-bottom:5px;border-bottom:1px solid #ddd;">
    <tr>
        <th>{$LANG.metrics.metric}</th>
        <th>{$LANG.metrics.currentUsage}</th>
        <th>{$LANG.metrics.pricing}</th>
        <th>{$LANG.metrics.lastUpdated}</th>
    </tr>
    {foreach $metricStats as $metric}
        <tr>
            <td>{$metric.displayName}</td>
            <td>{$metric.currentValue}</td>
            <td>
                {if count($metric.pricing) > 1}
                    {$LANG.metrics.startingFrom} {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                    <br>
                    <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modalMetricPricing-{$metric.systemName}">
                        {$LANG.metrics.viewPricing}
                    </button>
                {elseif count($metric.pricing) == 1}
                    {$metric.lowestPrice} / {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}
                    {if $metric.includedQuantity > 0} ({$metric.includedQuantity} {$LANG.metrics.includedNotCounted}){/if}
                {else}
                    &mdash;
                {/if}
                {include file="$template/usagebillingpricing.tpl"}
            </td>
            <td>{if is_string($metric.lastUpdated)}{$metric.lastUpdated}{else}{$metric.lastUpdated->diffForHumans()}{/if}</td>
        </tr>
    {/foreach}
</table>