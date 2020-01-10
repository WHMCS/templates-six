<div class="modal fade modal-metric-pricing" tabindex="-1" role="dialog" id="modalMetricPricing-{$metric.systemName}">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">{$metric.displayName} {$LANG.metrics.pricing}</h4>
            </div>
            <div class="modal-body">
                <p>{$metric.pricingSchema.info}<br/>
                    {$metric.pricingSchema.detail}
                </p>
                <table class="table table-condensed table-striped">
                    <tr>
                        <th class="text-center">{$LANG.metrics.startingQuantity}</th>
                        <th class="text-center">{$LANG.metrics.pricePer} {if $metric.unitName}{$metric.unitName}{else}{$LANG.metrics.unit}{/if}</th>
                    </tr>
                    {foreach $metric.pricing as $pricing}
                        <tr>
                            <td>{$pricing.from}</td>
                            <td>{$pricing.price_per_unit}</td>
                        </tr>
                    {/foreach}
                </table>
                {if $metric.includedQuantity}
                    <p>{$metric.includedQuantity} {$metric.includedQuantityUnits} {$LANG.metrics.includedInBase}</p>
                {/if}
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.close}</button>
            </div>
        </div>
    </div>
</div>