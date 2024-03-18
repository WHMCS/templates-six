<div class="sitejet-panel-container">
    <div class="sitejet-preview-item">
        <img src="{routePath('clientarea-sitejet-get-preview', $sitejetServices[0]->id)}"
             onerror="this.src = whmcsBaseUrl + '/assets/img/sitejet/preview_placeholder.png';"
             alt="Sitejet Preview"
             class="img-responsive"
             onload="this.style.opacity = 1"
             id="sitejetPromoImage"
             style="max-width:100%; max-height: 130px; border: 1px solid #ddd; transition: opacity 0.2s ease-in-out; opacity: 0"
        />
    </div>
    <div class="sitejet-actions-item">
        <div>
            <div style="margin-bottom: 8px;">{lang key='sitejetBuilder.chooseWebsite'}</div>
            <div style="display: flex;gap: 6px; min-width: 250px;">
                <select id="sitejetServiceSelect" class="form-control">
                    {foreach $sitejetServices as $key => $service}
                        <option value="{$service->id}">{$service->domain}</option>
                    {/foreach}
                </select>
                <button class="btn btn-primary btn-custom-action div-service-item"
                        id="sitejetSsoButton"
                        data-serviceid="{$sitejetServices[0]->id}"
                        data-identifier="sitejet"
                        data-active="true"
                        style="min-width: 120px; display: block;"
                >
                    {lang key="sitejetBuilder.editWebsite"}
                </button>
            </div>
            <div class="alert alert-danger" id="sitejetAlert"
                 style="display: none; margin: 10px 0;">{lang key="errorButTryAgain"}</div>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function() {
        let sitejetPreviewImage = jQuery('#sitejetPromoImage');

        jQuery('#sitejetServiceSelect').on('change', function (e) {
            let serviceId = jQuery(e.target).val();

            if (serviceId) {
                jQuery('#sitejetSsoButton').data('serviceid', serviceId);

                // if this were to fail to load, the below onerror handler will fall back to a placeholder image
                sitejetPreviewImage.attr(
                    'src',
                    WHMCS.utils.getRouteUrl('/clientarea/sitejet/service/' + serviceId + '/preview')
                ).css('opacity', 0.3);

                sitejetPreviewImage.data('is-placeholder', false);
            }
        })

        sitejetPreviewImage.removeAttr('onerror').error(function() {
            if (!sitejetPreviewImage.data('is-placeholder')) {
                sitejetPreviewImage.attr(
                    'src',
                    whmcsBaseUrl + '/assets/img/sitejet/preview_placeholder.png'
                );

                sitejetPreviewImage.data('is-placeholder', true);
            }
        });
    });
</script>
