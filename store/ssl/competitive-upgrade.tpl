<link href="{$WEB_ROOT}/templates/{$template}/store/css/style.css" rel="stylesheet">

<div class="landing-page ssl">

    <div class="hero">
        <div class="container">
            <h2>{lang key='store.ssl.competitiveUpgrades.switch'}</h2>
            <h3>{lang key='store.ssl.competitiveUpgrades.replace'}</h3>
        </div>
    </div>

    {include file="$template/store/ssl/shared/nav.tpl" current="competitiveupgrade"}

    <div class="content-block">
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                    <h4>{lang key='store.ssl.competitiveUpgrades.buyWithTime'} <strong>{lang key='store.ssl.competitiveUpgrades.foc'}</strong>.</h4>

                    <div class="alert alert-warning text-left">
                        <strong><i class="fas fa-star fa-5x pull-left"></i> {lang key='store.ssl.competitiveUpgrades.exampleScenario'}</strong><br>
                        {lang key='store.ssl.competitiveUpgrades.example.line1'}
                        {lang key='store.ssl.competitiveUpgrades.example.line2'}
                        {lang key='store.ssl.competitiveUpgrades.example.line3'}
                    </div>

                    <p>{lang key='store.ssl.competitiveUpgrades.eligibilityCheck'}</p>

                    {if $connectionError}
                        <div class="alert alert-danger">
                            {lang key='store.ssl.competitiveUpgrades.checkFailed'}
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
                                    {lang key='store.ssl.competitiveUpgrades.eligible'}
                                </div>
                                <table class="table table-striped">
                                    <tr>
                                        <td>{lang key='store.ssl.competitiveUpgrades.expirationDate'}</td>
                                        <td>{$expirationDate}</td>
                                    </tr>
                                    <tr>
                                        <td>{lang key='store.ssl.competitiveUpgrades.monthsRemaining'}</td>
                                        <td>{lang key='store.ssl.competitiveUpgrades.months' months=$monthsRemaining}</td>
                                    </tr>
                                    <tr>
                                        <td>{lang key='store.ssl.competitiveUpgrades.freeExtension'}</td>
                                        <td>{lang key='store.ssl.competitiveUpgrades.months' months=$freeExtensionMonths}{if $freeExtensionMonths < $monthsRemaining} ({lang key='store.ssl.competitiveUpgrades.maxMonths'}){/if}</td>
                                    </tr>
                                    {if isset($maxPotentialSavingAmount)}
                                        <tr>
                                            <td>{lang key='store.ssl.competitiveUpgrades.saving'}</td>
                                            <td>{lang key='store.ssl.competitiveUpgrades.savingDescription' saveAmount=$maxPotentialSavingAmount}</td>
                                        </tr>
                                    {/if}
                                </table>
                                <a class="btn btn-primary btn-lg" href="{routePath('store-ssl-certificates-ev')}">
                                    {lang key='store.ssl.competitiveUpgrades.continue'}
                                </a>
                            {else}
                                <div class="alert alert-warning text-center">
                                    {lang key='store.ssl.competitiveUpgrades.ineligible'}*.
                                </div>
                            {/if}
                        {/if}

                        {if !$validated || !$eligible}
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">https://</span>
                                <input type="text" name="url" value="{$url}" class="form-control" placeholder="{lang key='store.ssl.competitiveUpgrades.enterDomain'}">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-primary">
                                        {lang key='store.ssl.competitiveUpgrades.validate'}
                                    </button>
                                </span>
                            </div>
                            <p><small>* {lang key='store.ssl.competitiveUpgrades.competitors'}</small></p>
                        {/if}
                    </form>

                </div>
            </div>
        </div>
    </div>

</div>
