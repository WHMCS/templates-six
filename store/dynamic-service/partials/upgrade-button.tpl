<div class="row">
    <div class="col-12 mb-4">
        <div class="card border-success">
            <div class="card-header bg-success text-white">
                <strong>{lang key='upgrade'}</strong>
            </div>
            <div class="card-body text-center">
                <p class="text-muted mb-3">
                    {lang key='upgradeServiceDescription'}
                </p>
                <form method="post" action="{routePath('upgrade')}">
                    <input type="hidden" name="isproduct" value="{$parameters->isProduct()}">
                    <input type="hidden" name="serviceid" value="{$parameters->getUpgradeServiceId()}">
                    <button type="submit" class="btn btn-success btn-lg">
                        <i class="fas fa-level-up-alt"></i> {lang key='upgrade'}
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
