<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>Switch to Symantec SSL</h2>
            <h3>Replace your current SSL Certificate without losing any time or money</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="competitiveupgrade"}

    <div class="content-block">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <h4>Buy a new SSL Certificate from us and we'll add any remaining time you have on your current SSL Certificate up to a maximum of an additional 12 months <strong>free of charge</strong>.</h4>

                    <div class="alert alert-warning text-left">
                        <strong><i class="fas fa-star fa-5x pull-left"></i> Example Scenario</strong><br>
                        Your current 2 year certificate has 11 months left to run.
                        You make the switch and your new certificate will be valid for <strong>1 year AND 11 months</strong>.
                        The fee for the new certificate will <strong>ONLY</strong> be for 1 year.
                    </div>

                    <p>This special upgrade offer is available for SSL Certificates issued by one of the supported competitor SSL providers*. Enter your domain name below to validate your eligibility and see how much you could save.</p>

                    {if $connectionError}
                        <div class="alert alert-danger">
                            Unable to connect to the validation API. Please try again later or contact support.
                        </div>
                    {elseif $error}
                        <div class="alert alert-danger">
                            {$error}
                        </div>
                    {else}
                        <br>
                    {/if}

                    <form method="post" action="{routePath('store-ssl-certificates-competitiveupgrade-validate')}">

                        {if $validated}
                            {if $eligible}
                                <div class="alert alert-success text-center">
                                    Congratulations! Your domain is eligible for the Symantec Competitive Upgrade Offer.
                                </div>
                                <table class="table table-striped">
                                    <tr>
                                        <td>Current Expiration Date</td>
                                        <td>{$expirationDate}</td>
                                    </tr>
                                    <tr>
                                        <td>Months Remaining</td>
                                        <td>{$monthsRemaining} Months</td>
                                    </tr>
                                    <tr>
                                        <td>Free Extension Eligibility</td>
                                        <td>{$freeExtensionMonths} Months{if $freeExtensionMonths < $monthsRemaining} (Maximum of 12 months offered){/if}</td>
                                    </tr>
                                    {if isset($maxPotentialSavingAmount)}
                                        <tr>
                                            <td>Potential Saving</td>
                                            <td>Save up to <strong>{$maxPotentialSavingAmount}</strong> on a new certificate!</td>
                                        </tr>
                                    {/if}
                                </table>
                                <a class="btn btn-primary btn-lg" href="{routePath('store-ssl-certificates-ev')}">
                                    Continue to Choose SSL Certificate
                                </a>
                            {else}
                                <div class="alert alert-warning text-center">
                                    Unfortunately the domain you entered is not eligible for the Symantec Competitive Upgrade Offer. Please verify the domain is entered correctly and has an active and current SSL Certificate from one of the supported vendors*.
                                </div>
                            {/if}
                        {/if}

                        {if !$validated || !$eligible}
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">https://</span>
                                <input type="text" name="url" value="{$url}" class="form-control" placeholder="Enter your domain here">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary">
                                        Validate
                                    </button>
                                </span>
                            </div>
                            <p><small>* Offer valid for Comodo, GlobalSign, Entrust, and GoDaddy SSL Certificates.</small></p>
                        {/if}
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>
