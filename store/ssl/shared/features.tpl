<div class="content-block standout-features standout">
    <div class="container">
        <div class="row text-center">
            {if $type == 'ev'}
                <div class="col-sm-4">
                    <h4>{lang key='store.ssl.shared.ev.visualVerification'}</h4>
                    <p>{lang key='store.ssl.shared.ev.visualVerificationDescription'}</p>
                </div>
            {elseif $type == 'ov'}
                <div class="col-sm-4">
                    <h4>{lang key='store.ssl.shared.ov.ov'}</h4>
                    <p>{lang key='store.ssl.shared.ov.ovDescription'}</p>
                </div>
            {else}
                <div class="col-sm-4">
                    <h4>{lang key='store.ssl.shared.delivery'}</h4>
                    <p>{lang key='store.ssl.shared.deliveryDescription'}</p>
                </div>
            {/if}
            <div class="col-sm-4">
                <h4>{lang key='store.ssl.shared.siteSeal'}</h4>
                <p>{lang key='store.ssl.shared.siteSealDescription'}</p>
            </div>
            {if $type == 'ev'}
                <div class="col-sm-4">
                    <h4>{lang key='store.ssl.shared.ev.warranty'}</h4>
                    <p>{lang key='store.ssl.shared.ev.warrantyDescription'}</p>
                </div>
            {elseif $type == 'ov'}
                <div class="col-sm-4">
                    <h4>{lang key='store.ssl.shared.ov.warranty'}</h4>
                    <p>{lang key='store.ssl.shared.ov.warrantyDescription'}</p>
                </div>
            {else}
                <div class="col-sm-4">
                    <h4>{lang key='store.ssl.shared.googleRanking'}</h4>
                    <p>{lang key='store.ssl.shared.googleRankingDescription'}</p>
                </div>
            {/if}
        </div>
    </div>
</div>

<div class="content-block features">
    <div class="container">
        <h3>{lang key='store.ssl.shared.features'}</h3>
        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-lock"></i>
                    <h4>{lang key='store.ssl.shared.encryptData'}</h4>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-credit-card"></i>
                    <h4>{lang key='store.ssl.shared.secureTransactions'}</h4>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-trophy"></i>
                    <h4>{lang key='store.ssl.shared.legitimacy'}</h4>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-certificate"></i>
                    <h4>{lang key='store.ssl.shared.fastestSsl'}</h4>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-window-maximize"></i>
                    <h4>{lang key='store.ssl.shared.browserCompatability'}</h4>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-search"></i>
                    <h4>{lang key='store.ssl.shared.seoRank'}</h4>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="far fa-clock"></i>
                    {if $type == 'ev'}
                        <h4>{lang key='store.ssl.shared.ev.issuance'}</h4>
                    {elseif $type == 'ov'}
                        <h4>{lang key='store.ssl.shared.ov.issuance'}</h4>
                    {else}
                        <h4>{lang key='store.ssl.shared.issuance'}</h4>
                    {/if}
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="feature">
                    <i class="fas fa-sync"></i>
                    <h4>{lang key='store.ssl.shared.freeReissues'}</h4>
                </div>
            </div>
        </div>
    </div>
</div>
