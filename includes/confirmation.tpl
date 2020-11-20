<button type="button" class="btn btn-sm btn-default" data-toggle="modal" data-target="#confirmModal{$modalId}">
    {$buttonTitle}
</button>

<div class="modal fade" id="confirmModal{$modalId}" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel{$modalId}" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="{lang key='close'}">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="confirmModalLabel{$modalId}">{$modalTitle}</h4>
            </div>
            <div class="modal-body">
                {$modalBody}
            </div>
            <div class="modal-footer">
                <button id="btnConfirmModalConfirmBtn"
                        type="button"
                        class="btn btn-success"
                        data-target-url="{$targetUrl}"
                >
                    {if $saveBtnIcon}
                        <i class="{$saveBtnIcon}"></i>
                    {/if}
                    {$saveBtnTitle}
                </button>
                <button type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                >
                    {if $closeBtnIcon}
                    <i class="{$closeBtnIcon}"></i>
                    {/if}
                    {$closeBtnTitle}
                </button>
            </div>
        </div>
    </div>
</div>