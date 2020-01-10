<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{$companyname} - {$LANG.quotenumber}{$id}</title>

    <link href="{$WEB_ROOT}/templates/{$template}/css/all.min.css" rel="stylesheet">
    <link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="{$WEB_ROOT}/templates/{$template}/css/invoice.css" rel="stylesheet">

</head>
<body>

    <div class="container-fluid invoice-container">

        {if $invalidQuoteIdRequested}

            {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoiceserror bodyTextCenter=true}

        {else}

            <div class="row">
                <div class="col-sm-7">

                    {if $logo}
                        <p><img src="{$logo}" title="{$companyname}" /></p>
                    {else}
                        <h2>{$companyname}</h2>
                    {/if}
                    <h3>{$LANG.quotenumber}{$id}</h3>

                </div>
                <div class="col-sm-5 text-center">

                    <div class="invoice-status">
                        {if $stage eq "Delivered"}
                            <span class="unpaid">{$LANG.quotestagedelivered}</span>
                        {elseif $stage eq "Accepted"}
                            <span class="paid">{$LANG.quotestageaccepted}</span>
                        {elseif $stage eq "On Hold"}
                            <span class="refunded">{$LANG.quotestageonhold}</span>
                        {elseif $stage eq "Lost"}
                            <span class="cancelled">{$LANG.quotestagelost}</span>
                        {elseif $stage eq "Dead"}
                            <span class="collections">{$LANG.quotestagedead}</span>
                        {/if}
                    </div>

                    {if $stage eq "Delivered" || $stage eq "On Hold"}
                        <div class="payment-btn-container" align="center">
                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#acceptQuoteModal"><i class="fas fa-check-circle"></i> {$LANG.quoteacceptbtn}</button>
                        </div>
                    {/if}

                </div>
            </div>

            <hr>

            {if $agreetosrequired}
                {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.ordererroraccepttos bodyTextCenter=true}
            {/if}

            <div class="row">
                <div class="col-xs-6">
                    <strong>{$LANG.quoterecipient}:</strong>
                    <address class="small-text">
                        {if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
                        {$clientsdetails.firstname} {$clientsdetails.lastname}<br />
                        {$clientsdetails.address1}, {$clientsdetails.address2}<br />
                        {$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
                        {$clientsdetails.country}
                        {if $customfields}
                        <br /><br />
                        {foreach from=$customfields item=customfield}
                        {$customfield.fieldname}: {$customfield.value}<br />
                        {/foreach}
                        {/if}
                    </address>
                </div>
                <div class="col-xs-6 text-right">
                    <strong>{$LANG.invoicespayto}:</strong>
                    <address class="small-text">
                        {$payto}
                    </address>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-6">
                    <strong>{$LANG.quotedatecreated}:</strong><br>
                    <span class="small-text">
                        {$datecreated}<br /><br />
                    </span>
                </div>
                <div class="col-xs-6 text-right">
                    <strong>{$LANG.quotevaliduntil}:</strong><br>
                    <span class="small-text">
                        {$validuntil}<br /><br />
                    </span>
                </div>
            </div>

            <br />

            {if $proposal}
                {include file="$template/includes/panel.tpl" type="warning" headerTitle=$LANG.quoteproposal bodyContent=$proposal}
            {/if}

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>{$LANG.quotelineitems}</strong></h3>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-condensed">
                            <thead>
                                <tr>
                                    <td><strong>{$LANG.invoicesdescription}</strong></td>
                                    <td class="text-center"><strong>{$LANG.quotediscountheading}</strong></td>
                                    <td width="20%" class="text-center"><strong>{$LANG.invoicesamount}</strong></td>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$quoteitems item=item}
                                    <tr>
                                        <td>{$item.description}{if $item.taxed} *{/if}</td>
                                        <td class="text-center">{if $item.discountpc > 0}{$item.discount} ({$item.discountpc}%){else} - {/if}</td>
                                        <td class="text-center">{$item.amount}</td>
                                    </tr>
                                {/foreach}
                                <tr>
                                    <td colspan="2" class="total-row text-right"><strong>{$LANG.invoicessubtotal}</strong></td>
                                    <td class="total-row text-center">{$subtotal}</td>
                                </tr>
                                {if $taxrate}
                                    <tr>
                                        <td colspan="2" class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
                                        <td class="total-row text-center">{$tax}</td>
                                    </tr>
                                {/if}
                                {if $taxrate2}
                                    <tr>
                                        <td colspan="2" class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
                                        <td class="total-row text-center">{$tax2}</td>
                                    </tr>
                                {/if}
                                <tr>
                                    <td colspan="2" class="total-row text-right"><strong>{$LANG.quotelinetotal}</strong></td>
                                    <td class="total-row text-center">{$total}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            {if $notes}
                {include file="$template/includes/panel.tpl" type="info" headerTitle=$LANG.invoicesnotes bodyContent=$notes}
            {/if}

            {if $taxrate}
                <p>* {$LANG.invoicestaxindicator}</p>
            {/if}

            <div class="pull-right btn-group btn-group-sm hidden-print">
                <a href="javascript:window.print()" class="btn btn-default"><i class="fas fa-print"></i> {$LANG.print}</a>
                <a href="dl.php?type=q&amp;id={$quoteid}" class="btn btn-default"><i class="fas fa-download"></i> {$LANG.invoicesdownload}</a>
            </div>

        {/if}

    </div>

    <p class="text-center hidden-print"><a href="clientarea.php">{$LANG.invoicesbacktoclientarea}</a></a></p>

    <form method="post" action="viewquote.php?id={$quoteid}&amp;action=accept">
        <div class="modal fade" id="acceptQuoteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">{$LANG.quoteacceptbtn}</h4>
                    </div>
                    <div class="modal-body">
                        <p>{$LANG.quoteacceptagreetos}</p>
                        <p class="text-center">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="agreetos" />
                                {$LANG.ordertosagreement} <a href="{$tosurl}" target="_blank">{$LANG.ordertos}</a>
                            </label>
                        </p>
                        <small>{$LANG.quoteacceptcontractwarning}</small>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{$LANG.cancel}</button>
                        <button type="submit" class="btn btn-primary">{$LANG.quoteacceptbtn}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Javascript -->
    <script src="{$BASE_PATH_JS}/jquery.min.js"></script>
    <script src="{$BASE_PATH_JS}/bootstrap.min.js"></script>

</body>
</html>
