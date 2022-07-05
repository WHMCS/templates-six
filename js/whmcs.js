/**
 * Javascript functions utilised by the client area templates.
 *
 * @file WHMCS Six Theme Javascript Library
 * @copyright Copyright 2015 WHMCS Limited
 */

jQuery(document).ready(function() {

    // Init Lightbox2
    lightbox.init();

    // Language chooser popover
    jQuery('#languageChooser').popover({
        container: 'body',
        placement: 'bottom',
        template: '<div class="popover language-popover" role="tooltip"><div class="arrow"></div><div class="popover-content"></div></div>',
        html: true,
        content: function() {
            return jQuery("#languageChooserContent").html();
        },
    });

    // Login or register popover
    jQuery('#loginOrRegister').popover({
        container: 'body',
        placement: 'bottom',
        template: '<div class="popover login-popover" role="tooltip"><div class="arrow"></div><div class="popover-content"></div></div>',
        html: true,
        content: function() {
            return jQuery("#loginOrRegisterContent").html();
        },
    });

    // Account notifications popover
    jQuery("#accountNotifications").popover({
        container: 'body',
        placement: 'bottom',
        template: '<div class="popover popover-user-notifications" role="tooltip"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>',
        html: true,
        content: function() {
            return jQuery("#accountNotificationsContent").html();
        },
    });

    jQuery('.panel-sidebar .truncate').each(function () {
        jQuery(this).attr('title', jQuery(this).text())
            .attr('data-toggle', 'tooltip')
            .attr('data-placement', 'bottom');
    });

    // Default catch for all other popovers
    jQuery('[data-toggle="popover"]').popover({
        html: true
    });

    // Enable tooltips
    // Attach function to body so tooltips inserted by ajax will load
    jQuery(function(jQuery){
        jQuery('body').tooltip({
            selector: '[data-toggle="tooltip"]'
        });
    });

    // Logic to dismiss popovers on click outside
    jQuery('body').on('click', function (e) {
        jQuery('[data-toggle="popover"]').each(function () {
            if (!jQuery(this).is(e.target) && jQuery(this).has(e.target).length === 0 && jQuery('.popover').has(e.target).length === 0) {
                jQuery(this).popover('hide');
            }
        });
    });

    // Sidebar active class toggle
    jQuery(".list-group-tab-nav a").click(function() {
        if (jQuery(this).hasClass('disabled')) {
            return false;
        }
        jQuery(".list-group-tab-nav a").removeClass('active');
        jQuery(this).addClass('active');
        var urlFragment = this.href.split('#')[1];
        if (urlFragment) {
            // set the fragment in the URL bar for bookmarking and such.
            window.location.hash = '#' + urlFragment;
        }
    });

    // Sidebar minimise/maximise
    jQuery('.panel-minimise').click(function(e) {
        e.preventDefault();
        if (jQuery(this).hasClass('minimised')) {
            jQuery(this).parents('.panel').find('.panel-body, .list-group').slideDown();
            jQuery(this).removeClass('minimised');
        } else {
            jQuery(this).parents('.panel').find('.panel-body, .list-group').slideUp();
            jQuery(this).addClass('minimised');
        }
    });

    // Minimise sidebar panels by default on small devices
    if (jQuery('.container').width() <= 720) {
        jQuery('.panel-sidebar').find('.panel-body, .list-group').hide();
        jQuery('.panel-sidebar').find('.panel-minimise').addClass('minimised');
    }

    // Internal page tab selection handling via location hash
    if (jQuery(location).attr('hash').substr(1) != "") {
        var activeTab = jQuery(location).attr('hash');
        jQuery(".tab-pane").removeClass('active');
        jQuery(activeTab).removeClass('fade').addClass('active');
        jQuery(".list-group-tab-nav a").removeClass('active');
        jQuery('a[href="' + activeTab + '"]').addClass('active');
        setTimeout(function() {
            // Browsers automatically scroll on page load with a fragment.
            // This scrolls back to the top right after page complete, but
            // just before render (no perceptible scroll).
            window.scrollTo(0, 0);
        }, 1);
    }

    // Enable Switches for Checkboxes
    if (jQuery.prototype.bootstrapSwitch) {
        jQuery(".toggle-switch-success").bootstrapSwitch({
            onColor: 'success'
        });
    }

    // Collapsable Panels
    jQuery(".panel-collapsable .panel-heading").click(function(e) {
        var $this = jQuery(this);
        if (!$this.parents('.panel').hasClass('panel-collapsed')) {
            $this.parents('.panel').addClass('panel-collapsed').find('.panel-body').slideUp();
            $this.find('.collapse-icon i').removeClass('fa-minus').addClass('fa-plus');
        } else {
            $this.parents('.panel').removeClass('panel-collapsed').find('.panel-body').slideDown();
            $this.find('.collapse-icon i').removeClass('fa-plus').addClass('fa-minus');
        }
    });

    // Two-Factor Authentication Auto Focus Rules
    if (("#frmLogin").length > 0) {
        jQuery("#frmLogin input:text:visible:first").focus();
    }
    if (("#twofaactivation").length > 0) {
        jQuery("#twofaactivation input:text:visible:first,#twofaactivation input:password:visible:first").focus();
    }

    // Sub-Account Activation Toggle
    jQuery("#inputSubaccountActivate").click(function () {
        if (jQuery("#inputSubaccountActivate:checked").val() != null) {
            jQuery("#subacct-container").removeClass('hidden');
        } else {
            jQuery("#subacct-container").addClass('hidden');
        }
    });

    // Mass Domain Management Bulk Action Handling
    jQuery(".setBulkAction").click(function(event) {
        event.preventDefault();
        var id = jQuery(this).attr('id').replace('Link', ''),
            domainForm = jQuery('#domainForm');

        if (id === 'renewDomains') {
            domainForm.attr('action', WHMCS.utils.getRouteUrl('/cart/domain/renew'));
        } else {
            if (jQuery('#' + id).length !== 0) {
                var action = domainForm.attr('action');
                domainForm.attr('action', action + '#' + id);
            }
            jQuery('#bulkaction').val(id);
        }
        domainForm.submit();
    });

    // Stop events on objects with this class from bubbling up the dom
    jQuery('.stopEventBubble').click( function(event) {
        event.stopPropagation();
    });

    // Tab Control Link handling for tab switching via regular links
    jQuery('.tabControlLink').on(
        'click',
        function(event) {
            event.preventDefault();
            var id = jQuery(this).attr('href');
            jQuery("a[href='/"+id+"']").click();
        }
    );

    jQuery(document).on('click', '.delete-cc-email', function() {
        var self = jQuery(this),
            email = self.data('email'),
            feedback = jQuery('#divCcEmailFeedback');

        if (feedback.is(':visible')) {
            feedback.slideUp('fast');
        }

        WHMCS.http.jqClient.jsonPost({
            url: window.location.href,
            data: {
                action: 'delete',
                email: email,
                token: csrfToken
            },
            success: function (data) {
                if (data.success) {
                    self.closest('.ticket-cc-email').parent('div').slideUp('fast').remove();
                    feedback.slideUp('fast')
                        .removeClass('alert-danger hidden')
                        .addClass('alert-success')
                        .html(data.message)
                        .slideDown('fast');
                }
            },
            error: function (error) {
                if (error) {
                    feedback.slideUp('fast')
                        .removeClass('alert-success hidden')
                        .addClass('alert-danger')
                        .html(error)
                        .slideDown('fast');
                }
            }
        });
    }).on('submit', '#frmAddCcEmail', function(e) {
        e.preventDefault();
        var frm = jQuery(this),
            cloneRow = jQuery('#ccCloneRow').clone().removeAttr('id'),
            email = jQuery('#inputAddCcEmail'),
            feedback = jQuery('#divCcEmailFeedback');

        if (feedback.is(':visible')) {
            feedback.slideUp('fast');
        }
        WHMCS.http.jqClient.jsonPost({
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
                if (data.success) {
                    cloneRow.find('span.email')
                        .html(email.val())
                        .find('button')
                        .data('email', email.val())
                        .end();

                    cloneRow.removeClass('hidden')
                        .appendTo(jQuery('#sidebarTicketCc').find('.list-group'));
                    email.val('');
                    feedback.slideUp('fast')
                        .removeClass('alert-danger hidden')
                        .addClass('alert-success')
                        .html(data.message)
                        .slideDown('fast');
                }
            },
            error: function (error) {
                if (error) {
                    feedback.slideUp('fast')
                        .removeClass('alert-success hidden')
                        .addClass('alert-danger')
                        .html(error)
                        .slideDown('fast');
                }
            }
        });
    });

    // Ticket Rating Click Handler
    jQuery('.ticket-reply .rating span.star').click( function(event) {
        window.location = 'viewticket.php?tid='
            + jQuery(this).parent('.rating').attr("ticketid")
            + '&c=' + jQuery(this).parent('.rating').attr("ticketkey")
            + '&rating=rate' + jQuery(this).parent('.rating').attr("ticketreplyid")
            + '_' + jQuery(this).attr("rate");
    });

    // Prevent malicious window.opener activity from auto-linked URLs
    jQuery('a.autoLinked').click(function (e) {
        e.preventDefault();
        if (jQuery(this).hasClass('disabled')) {
            return false;
        }

        var child = window.open();
        child.opener = null;
        child.location = e.target.href;
    });

    // Handle Single Sign-On Toggle Setting
    jQuery("#inputAllowSso").on('switchChange.bootstrapSwitch', function(event, isChecked) {
        if (isChecked) {
            jQuery("#ssoStatusTextEnabled").removeClass('hidden').show();
            jQuery("#ssoStatusTextDisabled").hide();
        } else {
            jQuery("#ssoStatusTextDisabled").removeClass('hidden').show();
            jQuery("#ssoStatusTextEnabled").hide();
        }
        WHMCS.http.jqClient.post("clientarea.php", jQuery("#frmSingleSignOn").serialize());
    });

    // Single Sign-On call for Product/Service
    jQuery('.btn-service-sso').on('click', function(e) {
        e.preventDefault();
        var button = jQuery(this);

        var form = button.parents('form');

        if (form.length === 0) {
            form = button.find('form');
        }
        if (form.hasClass('disabled') || button.hasClass('disabled')) {
            return;
        }
        var url = form.data('href');
        if (!url) {
            url = window.location.href;
        }

        button.attr('disabled', 'disabled').addClass('disabled');
        jQuery('.loading', button).removeClass('hidden').show().end();
        jQuery('.login-feedback', form).slideUp();
        WHMCS.http.jqClient.post(
            url,
            form.serialize(),
            function (data) {
                jQuery('.loading', button).hide().end().removeAttr('disabled');
                jQuery('.login-feedback', form).html('');
                if (data.error) {
                    jQuery('.login-feedback', form).hide().html(data.error).slideDown();
                }
                if (data.redirect !== undefined && data.redirect.substr(0, 7) === 'window|') {
                    window.open(data.redirect.substr(7), '_blank');
                }
            },
            'json'
        ).always(function() {
            button.removeAttr('disabled').removeClass('disabled');
            jQuery('.loading', button).hide().end();
        });
    });
    jQuery('.btn-sidebar-form-submit').on('click', function(e) {
        e.preventDefault();
        jQuery(this).find('.loading').removeClass('hidden').show().end()
            .attr('disabled', 'disabled');

        var form = jQuery(this).parents('form');

        if (form.length == 0) {
            form = jQuery(this).find('form');
        }

        if (form.length !== 0 && form.hasClass('disabled') === false) {
            form.submit();
        } else {
            jQuery(this).find('.loading').hide().end().removeAttr('disabled');
        }
    });

    // Back to top animated scroll
    jQuery('.back-to-top').click(function(e) {
        e.preventDefault();
        jQuery('body,html').animate({scrollTop: 0}, 500);
    });

    // Prevent page scroll on language choose click
    jQuery('.choose-language').click(function(e) {
        e.preventDefault();
    });

    // Activate copy to clipboard functionality
    jQuery('.copy-to-clipboard').click(WHMCS.ui.clipboard.copy);

    // Password Generator
    jQuery('.generate-password').click(function(e) {
        jQuery('#frmGeneratePassword').submit();
        jQuery('#modalGeneratePassword')
            .data('targetfields', jQuery(this).data('targetfields'))
            .modal('show');
    });
    jQuery('#frmGeneratePassword').submit(function(e) {
        e.preventDefault();
        var length = parseInt(jQuery('#inputGeneratePasswordLength').val(), 10);

        // Check length
        if (length < 8 || length > 64) {
            jQuery('#generatePwLengthError').removeClass('hidden').show();
            return;
        }

        jQuery('#inputGeneratePasswordOutput').val(WHMCS.utils.generatePassword(length));
    });
    jQuery('#btnGeneratePasswordInsert')
        .click(WHMCS.ui.clipboard.copy)
        .click(function(e) {
            jQuery(this).closest('.modal').modal('hide');
            var targetFields = jQuery(this).closest('.modal').data('targetfields');
            targetFields = targetFields.split(',');
            for(var i = 0; i < targetFields.length; i++) {
                jQuery('#' + targetFields[i]).val(jQuery('#inputGeneratePasswordOutput').val())
                    .trigger('keyup');
            }
            // Remove the generated password.
            jQuery('#inputGeneratePasswordOutput').val('');
        });

    /**
     * Code will loop through each element that has the class markdown-editor and
     * enable the Markdown editor.
     */
    var count = 0,
        editorName = 'clientMDE',
        counter = 0;
    jQuery(".markdown-editor").each(function( index ) {
        count++;
        var autoSaveName = jQuery(this).data('auto-save-name'),
            footerId = jQuery(this).attr('id') + '-footer';
        if (typeof autoSaveName == "undefined") {
            autoSaveName = 'client_area';
        }
        window[editorName + count.toString()] = jQuery(this).markdown(
        {
            footer: '<div id="' + footerId + '" class="markdown-editor-status"></div>',
            autofocus: false,
            savable: false,
            resize: 'vertical',
            iconlibrary: 'glyph',
            language: locale,
            onShow: function(e){
                var content = '',
                    save_enabled = false;
                if(typeof(Storage) !== "undefined") {
                    // Code for localStorage/sessionStorage.
                    content = localStorage.getItem(autoSaveName);
                    save_enabled = true;
                    if (content && typeof(content) !== "undefined") {
                        e.setContent(content);
                    }
                }
                jQuery("#" + footerId).html(parseMdeFooter(content, save_enabled, saved));
            },
            onChange: function(e){
                var content = e.getContent(),
                    save_enabled = false;
                if(typeof(Storage) !== "undefined") {
                    counter = 3;
                    save_enabled = true;
                    localStorage.setItem(autoSaveName, content);
                    doCountdown();
                }
                jQuery("#" + footerId).html(parseMdeFooter(content, save_enabled));
            },
            onPreview: function(e){
                var originalContent = e.getContent(),
                    parsedContent;

                jQuery.ajax({
                    url: WHMCS.utils.getRouteUrl('/clientarea/message/preview'),
                    async: false,
                    data: {token: csrfToken, content: originalContent},
                    dataType: 'json',
                    success: function (data) {
                        parsedContent = data;
                    }
                });

                return parsedContent.body ? parsedContent.body : '';
            },
            additionalButtons: [
                [{
                    name: "groupCustom",
                    data: [{
                        name: "cmdHelp",
                        title: "Help",
                        hotkey: "Ctrl+F1",
                        btnClass: "btn open-modal",
                        icon: {
                            glyph: 'fas fa-question-circle',
                            fa: 'fas fa-question-circle',
                            'fa-3': 'icon-question-sign'
                        },
                        callback: function(e) {
                            e.$editor.removeClass("md-fullscreen-mode");
                        }
                    }]
                }]
            ],
            hiddenButtons: [
                'cmdImage'
            ]
        });

        jQuery('button[data-handler="bootstrap-markdown-cmdHelp"]')
            .attr('data-modal-title', markdownGuide)
            .attr('href', 'submitticket.php?action=markdown');

        jQuery(this).closest("form").bind({
            submit: function() {
                if(typeof(Storage) !== "undefined") {
                    localStorage.removeItem(autoSaveName);
                }
            }
        });
    });

    // Email verification
    var btnResendEmail = jQuery('.btn-resend-verify-email');
    jQuery(btnResendEmail).click(function() {
        $(this).prop('disabled', true).find('.loader').removeClass('hidden').show();
        WHMCS.http.jqClient.post(
            jQuery(this).data('uri'),
            {
                'token': csrfToken,
            }).done(function(data) {
                btnResendEmail.find('.loader').hide();
                if (data.success) {
                    btnResendEmail.text(btnResendEmail.data('email-sent'));
                } else {
                    btnResendEmail.text(btnResendEmail.data('error-msg'));
                }
            });
    });
    jQuery('#btnEmailVerificationClose').click(function(e) {
        e.preventDefault();
        WHMCS.http.jqClient.post(jQuery(this).data('uri'),
            {
                'token': csrfToken
            });
        jQuery('.verification-banner.email-verification').hide();
    });

    jQuery('#btnUserValidationClose').click(function(e) {
        e.preventDefault();
        WHMCS.http.jqClient.post(jQuery(this).data('uri'),
            {
                'token': csrfToken
            });
        jQuery('.verification-banner.user-validation').hide();
    });

    var ssoDropdown = jQuery('#servicesPanel').find('.list-group');
    if (parseInt(ssoDropdown.css('height'), 10) < parseInt(ssoDropdown.css('max-height'), 10)) {
        ssoDropdown.css('overflow', 'unset');
    }


    /**
     * Parse the content to populate the markdown editor footer.
     *
     * @param {string} content
     * @param {bool} auto_save
     * @param {string} [saveText]
     * @returns {string}
     */
    function parseMdeFooter(content, auto_save, saveText)
    {
        saveText = saveText || saving;
        var pattern = /[^\s]+/g,
            m = [],
            word_count = 0,
            line_count = 0;
        if (content) {
            m = content.match(pattern);
            line_count = content.split(/\\r\\n|\\r|\\n/).length;
        }
        if (m) {
            for (var i = 0; i < m.length; i++) {
                if (m[i].charCodeAt(0) >= 0x4E00) {
                    word_count += m[i].length;
                } else {
                    word_count += 1;
                }
            }
        }
        return '<div class="small-font">lines: ' + line_count
            + '&nbsp;&nbsp;&nbsp;words: ' + word_count + ''
            + (auto_save ? '&nbsp;&nbsp;&nbsp;<span class="markdown-save">' + saveText + '</span>' : '')
            + '</div>';
    }

    /**
     * Countdown the save timeout. When zero, the span will update to show saved.
     */
    function doCountdown()
    {
        if (counter >= 0) {
            if (counter == 0) {
                jQuery("span.markdown-save").html(saved);
            }
            counter--;
            setTimeout(doCountdown, 1000);
        }
    }

    // Two-Factor Activation Process Modal Handler.
    var frmTwoFactorActivation = jQuery('input[name=2fasetup]').parent('form');
    frmTwoFactorActivation.submit(function(e) {
        e.preventDefault();
        openModal(frmTwoFactorActivation.attr('action'), frmTwoFactorActivation.serialize(), 'Loading...');
    });

    $.fn.setInputError = function(error) {
        this.parents('.form-group').addClass('has-error').find('.field-error-msg').text(error);
        return this;
    };

    jQuery.fn.showInputError = function () {
        this.parents('.form-group').addClass('has-error').find('.field-error-msg').show();
        return this;
    };

    jQuery('#frmPayment').on('submit', function() {
        var btn = jQuery('#btnSubmit');
            btn.find('span').toggle();
            btn.prop('disabled', true).addClass('disabled');
    });

    // SSL Manage Action Button.
    jQuery('.btn-resend-approver-email').click(function () {
        WHMCS.http.jqClient.post(
            jQuery(this).data('url'),
            {
                addonId: jQuery(this).data('addonid'),
                serviceId: jQuery(this).data('serviceid'),
            },
            function(data) {
                if (data.success == true) {
                    jQuery('.alert-table-ssl-manage').addClass('alert-success').text('Approver Email Resent').removeClass('hidden');
                } else {
                    jQuery('.alert-table-ssl-manage').addClass('alert-danger').text('Error: ' + data.message).removeClass('hidden');
                }
            }
        );
    });

    // Domain Pricing Table Filters
    jQuery(".tld-filters a").click(function(e) {
        e.preventDefault();

        var noTlds = jQuery('.tld-row.no-tlds');

        if (jQuery(this).hasClass('badge-success')) {
            jQuery(this).removeClass('badge-success');
        } else {
            jQuery(this).addClass('badge-success');
        }
        if (noTlds.is(':visible')) {
            noTlds.hide();
        }

        jQuery('.tld-row').removeClass('filtered-row');
        jQuery('.tld-filters a.badge-success').each(function(index) {
            var filterValue = jQuery(this).data('category');
            jQuery('.tld-row[data-category*="' + filterValue + '"]').addClass('filtered-row');
        });
        jQuery(".filtered-row:even").removeClass('highlighted');
        jQuery(".filtered-row:odd").addClass('highlighted');

        var rowsToHide = jQuery('.tld-row:not(".filtered-row")');
        rowsToHide.fadeOut('fast');
        rowsToHide.promise().done(function () {
            if (jQuery('.filtered-row').length === 0) {
                noTlds.show();
            } else {
                jQuery('.tld-row.filtered-row').show();
            }
        });
    });
    jQuery(".filtered-row:even").removeClass('highlighted');
    jQuery(".filtered-row:odd").addClass('highlighted');

    // DataTable data-driven auto object registration
    WHMCS.ui.dataTable.register();

    WHMCS.ui.jsonForm.initAll();

    jQuery('#frmReply').submit(function(e) {
        jQuery('#frmReply').find('input[type="submit"]').addClass('disabled').prop('disabled', true);
    });

    jQuery('#frmDomainContactModification').on('submit', function(){
        if (!allowSubmit) {
            var changed = false;
            jQuery('.irtp-field').each(function() {
                var value = jQuery(this).val(),
                    originalValue = jQuery(this).data('original-value');
                if (value !== originalValue) {
                    changed = true;
                }
            });
            if (changed) {
                jQuery('#modalIRTPConfirmation').modal('show');
                return false;
            }
        }
        return true;
    });

    jQuery('.ssl-state.ssl-sync').each(function () {
        var self = jQuery(this),
            type = getSslAttribute(self, 'type'),
            domain = getSslAttribute(self, 'domain');
        WHMCS.http.jqClient.post(
            WHMCS.utils.getRouteUrl('/domain/ssl-check'),
            {
                'type': type,
                'domain': domain,
                'token': csrfToken
            },
            function (data) {
                if (data.invalid) {
                    self.hide();
                } else {
                    var width = '',
                        statusDisplayLabel = '';
                    if (self.attr('width')) {
                        width = ' width="' + self.attr('width') + '"';
                    }
                    if (self.data('showlabel')) {
                        statusDisplayLabel = ' ' + data.statusDisplayLabel;
                    }
                    self.replaceWith(
                        '<img src="' + data.image + '" data-toggle="tooltip" title="' + data.tooltip + '" class="' + data.class + '"' + width + '>'
                    );
                    if (data.ssl.status === 'active') {
                        jQuery('#ssl-startdate').text(data.ssl.startDate);
                        jQuery('#ssl-expirydate').text(data.ssl.expiryDate);
                        jQuery('#ssl-issuer').text(data.ssl.issuer);
                    } else {
                        jQuery('#ssl-startdate').parent('div').hide();
                        jQuery('#ssl-expirydate').parent('div').hide();
                        jQuery('#ssl-issuer').parent('div').hide();
                    }

                    jQuery('#statusDisplayLabel').text(statusDisplayLabel);
                }
            }
        );
    });

    jQuery(document).on('click', '.ssl-state.ssl-inactive', function(e) {
        e.preventDefault();
        window.location.href = WHMCS.utils.getRouteUrl('/ssl-purchase');
    });

    WHMCS.recaptcha.register();

    var dynamicRecaptchaContainer = jQuery('#divDynamicRecaptcha');
    var homepageHasRecaptcha = jQuery(dynamicRecaptchaContainer).length > 0;
    var homepageHasInvisibleRecaptcha = homepageHasRecaptcha && jQuery(dynamicRecaptchaContainer).data('size') === 'invisible';

    var frmDomainHomepage = jQuery('#frmDomainHomepage');

    jQuery(frmDomainHomepage).find('#btnTransfer').click(function () {
        jQuery(frmDomainHomepage).find('input[name="transfer"]').val('1');
    });

    if (homepageHasRecaptcha && !homepageHasInvisibleRecaptcha) {
        jQuery('section#home-banner').addClass('with-recaptcha');
    }

    if (jQuery('.domainchecker-homepage-captcha').length && !homepageHasInvisibleRecaptcha) {
        // invisible reCaptcha doesn't play well with onsubmit() handlers on all submissions following a prevented one

        jQuery(frmDomainHomepage).submit(function (e) {
            var inputDomain = jQuery(frmDomainHomepage).find('input[name="domain"]'),
                reCaptchaContainer = jQuery('#divDynamicRecaptcha'),
                reCaptcha = jQuery('#g-recaptcha-response'),
                captcha = jQuery('#inputCaptcha');

            if (reCaptcha.length && !reCaptcha.val()) {
                reCaptchaContainer.tooltip('show');

                e.preventDefault();
                return;
            }

            if (captcha.length && !captcha.val()) {
                captcha.tooltip('show');

                e.preventDefault();
                return;
            }
        });
    }

    $('.icheck-button').iCheck({
        inheritID: true,
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%'
    });

    jQuery('#inputNoStore').on('switchChange.bootstrapSwitch', function(event, state) {
        var descContainer = jQuery('#inputDescription');
        if (!state) {
            descContainer.prop('disabled', true).addClass('disabled');
        }
        if (state) {
            descContainer.removeClass('disabled').prop('disabled', false);
        }
    });

    jQuery(document).on('click', '#btnConfirmModalConfirmBtn', function () {
        var confirmButton = jQuery(this),
            confirmationModal = confirmButton.closest('div.modal'),
            targetUrl = confirmButton.data('target-url'),
            dataTable = confirmButton.closest('table.dataTable[data-on-draw-rebind-confirmation-modal="true"]');
        WHMCS.http.jqClient.jsonPost(
            {
                url: targetUrl,
                data: {
                    token: csrfToken
                },
                success: function(data) {
                    if (data.status === 'success' || data.status === 'okay') {
                        if (dataTable.length > 0) {
                            dataTable.DataTable().ajax.reload();
                        }
                    }
                }
            }
        );
        confirmationModal.modal('toggle');
    });
    jQuery('input[name="approval_method"]').on('ifChecked', function(event) {
        var fileMethod = $('#containerApprovalMethodFile'),
            emailMethod = $('#containerApprovalMethodEmail'),
            dnsMethod = $('#containerApprovalMethodDns');
        if (jQuery(this).attr('value') == 'file') {
            fileMethod.show();
            dnsMethod.hide();
            emailMethod.hide();
        } else if (jQuery(this).attr('value') == 'dns-txt-token') {
            dnsMethod.show();
            fileMethod.hide();
            emailMethod.hide();
        } else {
            fileMethod.hide();
            dnsMethod.hide();
            emailMethod.show();
        }
    });

    (function () {
        jQuery('.div-service-status').css(
            'width',
            (jQuery('.div-service-status .label-placeholder').outerWidth() + 5)
        );
    }());
    jQuery('div[menuitemname="Service Details Actions"] a[data-identifier][data-serviceid][data-active="1"]').on('click', function(event) {
        return customActionAjaxCall(event, jQuery(event.target))
    });
    jQuery('.div-service-item').on('click', function (event) {
        var element = jQuery(event.target);
        if (element.is('.dropdown-toggle, .dropdown-menu, .caret')) {
            return true;
        }
        if (element.hasClass('btn-custom-action')) {
            return customActionAjaxCall(event, element);
        }
        window.location.href = element.closest('.div-service-item').data('href');
        return false;
    });
});

/**
 * Control disabled/enabled state of elements by class name.
 *
 * @param {string} className     Common element class name.
 * @param {bool} disabledState   Whether the elements should be disabled or not.
 */
function disableFields(className, disabledState) {
    if (className[0] != '.') {
        className = '.' + className;
    }
    var elements = jQuery(className);
    elements.prop('disabled', disabledState);
    if (disabledState) {
        elements.addClass('disabled');
    } else {
        elements.removeClass('disabled');
    }
}

/**
 * Check all checkboxes with a given class.
 *
 * @param {string} className         Common class name.
 * @param {domElement} masterControl Parent checkbox to which the other checkboxes should mirror.
 */
function checkAll(className, masterControl) {
    if (className[0] != '.') {
        className = '.' + className;
    }
    // In jQuery, if you set the checked attribute directly, the dom
    // element is changed, but browsers don't show the check box as
    // checked.  Using the click event will properly display.
    jQuery(className).removeAttr('checked');
    if(jQuery(masterControl).is(":checked")) {
        jQuery(className).click();
    }
}

/**
 * Redirect on click if an element is not a button or link.
 *
 * Where table rows are clickable, we only want to redirect if the row
 * itself is clicked. If a button or link within the row is clicked,
 * the event tied to that object should be executed. This function
 * stops the standard JS event bubbling required to make that happen.
 *
 * @param {object} clickEvent jQuery click event
 * @param {string} target     Redirect location
 * @param {bool} newWindow    Open link in new window
 */
function clickableSafeRedirect(clickEvent, target, newWindow) {
    var eventSource = clickEvent.target.tagName.toLowerCase();
    var eventParent = clickEvent.target.parentNode.tagName.toLowerCase();
    var eventTable = clickEvent.target.parentNode.parentNode.parentNode;
    if (jQuery(eventTable).hasClass('collapsed')) {
        // This is a mobile device sized display, and datatables has triggered folding
        return false;
    }
    if (eventSource === 'i' && jQuery(clickEvent.target).hasClass('ssl-required')) {
        return false;
    }
    if(eventSource != 'button' && eventSource != 'a') {
        if(eventParent != 'button' && eventParent != 'a') {
            if (newWindow) {
                window.open(target);
            } else {
                window.location.href = target;
            }
        }
    }
}

/**
 * Open a centered popup window.
 *
 * @param {string} addr     The URL to navigate to
 * @param {string} popname  The name to assign the window
 * @param {number} w        The width
 * @param {number} h        The height
 * @param {string} features Any additional settings to apply
 */
function popupWindow(addr, popname, w, h, features) {
    var winl = (screen.width-w) / 2;
    var wint = (screen.height-h) / 2;
    if (winl < 0) winl = 0;
    if (wint < 0) wint = 0;
    var settings = 'height=' + h + ',';
    settings += 'width=' + w + ',';
    settings += 'top=' + wint + ',';
    settings += 'left=' + winl + ',';
    settings += features;
    win = window.open(addr, popname, settings);
    win.window.focus();
}

/**
 * Add domain renewal to shopping cart.
 *
 * @param {number} renewalID    The domain ID to be added
 * @param {domElement} selfThis The object triggering the add
 */
function addRenewalToCart(renewalID, selfThis) {
    jQuery("#domainRow" + renewalID).attr('disabled', 'disabled');
    jQuery("#domainRow" + renewalID).find("select,button").attr("disabled", "disabled");
    jQuery(selfThis).html('<span class="glyphicon glyphicon-shopping-cart"></span> Adding...');
    var renewalPeriod = jQuery("#renewalPeriod" + renewalID).val();
    WHMCS.http.jqClient.post(
        "clientarea.php",
        "addRenewalToCart=1&token=" + csrfToken + "&renewID="+ renewalID + "&period=" + renewalPeriod,
        function( data ) {
            jQuery("#cartItemCount").html(((jQuery("#cartItemCount").html() * 1) + 1));
            jQuery(selfThis).html('<span class="glyphicon glyphicon-shopping-cart"></span> Added');
            jQuery("#btnCheckout").fadeIn();
        }
    );
}

/**
 * Navigate to a page on dropdown change.
 *
 * This is implemented onblur() for a dropdown.  When the dropdown
 * changes state, the value is pulled and the browser navigated to
 * the selected page.
 *
 * @param {domElement} select The dropdown triggering the event
 */
function selectChangeNavigate(select) {
    window.location.href = $(select).val();
}

/**
 * Append additional file upload input field.
 */
function extraTicketAttachment() {
    jQuery("#fileUploadsContainer").append('<input type="file" name="attachments[]" class="form-control" />');
}

/**
 * Fetch load and uptime for a given server.
 *
 * @param {number} num Server Id
 */
function getStats(num) {
    WHMCS.http.jqClient.post('serverstatus.php', 'getstats=1&num=' + num, function(data) {
        jQuery("#load"+num).html(data.load);
        jQuery("#uptime"+num).html(data.uptime);
    },'json');
}

/**
 * Determine status of a given port for a given server.
 *
 * @param {number} num  Server Id
 * @param {number} port Port Number
 */
function checkPort(num, port) {
    WHMCS.http.jqClient.post('serverstatus.php', 'ping=1&num=' + num + '&port=' + port, function(data) {
        jQuery("#port" + port + "_" + num).html(data);
    });
}

/**
 * Fetch automated knowledgebase suggestions for ticket content.
 */
function getticketsuggestions() {
    currentcheckcontent = jQuery("#message").val();
    if (currentcheckcontent != lastcheckcontent && currentcheckcontent != "") {
        WHMCS.http.jqClient.post("submitticket.php", { action: "getkbarticles", text: currentcheckcontent },
            function(data){
            if (data) {
                jQuery("#searchresults").html(data);
                jQuery("#searchresults").hide().removeClass('hidden').slideDown();
            }
        });
        lastcheckcontent = currentcheckcontent;
    }
    setTimeout('getticketsuggestions();', 3000);
}

/**
 * Update custom fields upon department change.
 *
 * @param {domElement} input The department selector dropdown object
 */
function refreshCustomFields(input) {
    jQuery("#customFieldsContainer").load(
        "submitticket.php",
        { action: "getcustomfields", deptid: $(input).val() }
    );
}

/**
 * Submit the first form that exists within a given container.
 *
 * @param {string} containerId The ID name of the container
 */
function autoSubmitFormByContainer(containerId) {
    if (typeof noAutoSubmit === "undefined" || noAutoSubmit === false) {
        jQuery("#" + containerId).find("form:first").submit();
    }
}

/**
 * Submit default whois info and disable custom fields.
 *
 * @param {string} regType The contact registration type
 */
function useDefaultWhois(regType) {
    jQuery("." + regType.substr(0, regType.length - 1) + "customwhois").attr("disabled", true);
    jQuery("." + regType.substr(0, regType.length - 1) + "defaultwhois").attr("disabled", false);
    jQuery('#' + regType.substr(0, regType.length - 1) + '1').attr("checked", "checked");
}

/**
 * Submit custom fields and disable default whois info.
 *
 * @param {string} regType The contact registration type
 */
function useCustomWhois(regType) {
    jQuery("." + regType.substr(0, regType.length - 1) + "customwhois").attr("disabled", false);
    jQuery("." + regType.substr(0, regType.length - 1) + "defaultwhois").attr("disabled", true);
    jQuery('#' + regType.substr(0, regType.length - 1) + '2').attr("checked", "checked");
}

function showNewBillingAddressFields() {
    jQuery('#newBillingAddress').slideDown();
}

function hideNewBillingAddressFields() {
    jQuery('#newBillingAddress').slideUp();
}

/**
 * Show new credit card input fields.
 */
function showNewCardInputFields() {
    var ccDetails = jQuery('.cc-details'),
        ccNumber = jQuery('#inputCardNumber'),
        billAddress = jQuery('#billingAddressChoice');

    if (ccDetails.hasClass("hidden")) {
        ccDetails.hide().removeClass("hidden");
    }
    ccDetails.slideDown();
    ccNumber.focus();

    billAddress.slideDown()
        .find('input[name="billingcontact"]')
        .first()
        .iCheck('check');
}

/**
 * Show new bank account input fields.
 */
function showNewAccountInputFields() {
    if (jQuery(".bank-details").hasClass("hidden")) {
        jQuery(".bank-details").hide().removeClass("hidden");
    }
    jQuery(".bank-details").slideDown();

    jQuery("#billingAddressChoice")
        .slideDown()
        .find('input[name="billingcontact"]')
        .first()
        .iCheck('check');
}

/**
 * Hide new credit card input fields.
 */
function hideNewCardInputFields() {
    hideNewBillingAddressFields();
    jQuery(".cc-details").slideUp();
    jQuery("#billingAddressChoice").slideUp();
    var contactId = jQuery('input[name="ccinfo"]:checked').data('billing-contact-id');
    if (contactId != undefined) {
        jQuery('#billingAddressChoice label.billing-contact-' + contactId)
            .iCheck('check');
    }
    jQuery('#inputCardCvv').focus();
}

/**
 * Hide new bank account input fields.
 */
function hideNewAccountInputFields() {
    hideNewBillingAddressFields();

    jQuery(".bank-details").slideUp();
    jQuery("#billingAddressChoice").slideUp();

    var selectedAccount = jQuery('input[name="paymethod"]:checked'),
        selectedContactId = jQuery(selectedAccount).data('billing-contact-id'),
        selectedContactData = jQuery('.billing-contact-info[data-billing-contact-id="' + selectedContactId + '"]');

    if (selectedContactData.length) {
        jQuery('.billing-contact-info').hide();
        jQuery(selectedContactData).show();
    }
}

/**
 * Get automatic knowledgebase suggestions for support ticket message.
 */
var lastTicketMsg;
function getTicketSuggestions() {
    var userMsg = jQuery("#inputMessage").val();
    if (userMsg != lastTicketMsg && userMsg != '') {
        WHMCS.http.jqClient.post("submitticket.php", { action: "getkbarticles", text: userMsg },
            function (data) {
                if (data) {
                    jQuery("#autoAnswerSuggestions").html(data);
                    if (!jQuery("#autoAnswerSuggestions").is(":visible")) {
                        jQuery("#autoAnswerSuggestions").hide().removeClass('hidden').slideDown();
                    }
                }
            });
        lastTicketMsg = userMsg;
    }
    setTimeout('getTicketSuggestions()', 3000);
}

/**
 * Smooth scroll to named element.
 */
function smoothScroll(element) {
    $('html, body').animate({
        scrollTop: $(element).offset().top
    }, 500);
}

function irtpSubmit() {
    allowSubmit = true;
    var optOut = 0,
        optOutCheckbox = jQuery('#modalIrtpOptOut'),
        optOutReason = jQuery('#modalReason'),
        formOptOut = jQuery('#irtpOptOut'),
        formOptOutReason = jQuery('#irtpOptOutReason');

    if (optOutCheckbox.is(':checked')) {
        optOut = 1;
    }
    formOptOut.val(optOut);
    formOptOutReason.val(optOutReason.val());
    jQuery('#frmDomainContactModification').submit();
}

function showOverlay(msg) {
    jQuery('#fullpage-overlay .msg').html(msg);
    jQuery('#fullpage-overlay').removeClass('hidden').show();
}

function hideOverlay() {
    jQuery('#fullpage-overlay').hide();
}

function getSslAttribute(element, attribute) {
    if (element.data(attribute)) {
        return element.data(attribute);
    }
    return element.parent('td').data(attribute);
}

function openValidationSubmitModal(caller)
{
    var validationSubmitModal = jQuery('#validationSubmitModal');
    validationSubmitModal.find('.modal-body iframe').attr('src', caller.dataset.url);
    validationSubmitModal.modal('show');
}

function completeValidationComClientWorkflow()
{
    var submitDocsRequestBanner = jQuery('.user-validation'),
        secondarySidebarStatus = jQuery('.validation-status-label'),
        submitDiv = jQuery('.validation-submit-div'),
        redirectUser = true;

    $('#validationSubmitModal').modal('hide');
    if (submitDocsRequestBanner.length !== 0) {
        submitDocsRequestBanner.slideUp();
        redirectUser = false;
    }
    if (secondarySidebarStatus.length !== 0) {
        var submitString = submitDiv.find('a').data('submitted-string');
        secondarySidebarStatus.text(submitString).removeClass('label-default').addClass('label-warning');
        submitDiv.hide();
        redirectUser = false;
    }

    if (redirectUser) {
        window.location.href = WHMCS.utils.autoDetermineBaseUrl();
    }
    return false;
}

/**
 * Perform the AjaxCall for a CustomAction.
 *
 * @param event
 * @param element
 * @returns {boolean}
 */
function customActionAjaxCall(event, element) {
    event.stopPropagation();
    if (!element.data('active')) {
        return false;
    }
    element.attr('disabled', 'disabled').addClass('disabled');
    jQuery('.loading', element).show();
    WHMCS.http.jqClient.jsonPost({
        url: WHMCS.utils.getRouteUrl(
            '/clientarea/service/' + element.data('serviceid') + '/custom-action/' + element.data('identifier')
        ),
        data: {
            'token': csrfToken
        },
        success: function(data) {
            if (data.success) {
                window.open(data.redirectTo);
            } else {
                window.open('clientarea.php?action=productdetails&id=' + element.data('serviceid') + '&customaction_error=1');
            }
        },
        fail: function () {
            window.open('clientarea.php?action=productdetails&id=' + element.data('serviceid') + '&customaction_ajax_error=1');
        },
        always: function() {
            jQuery('.loading', element).hide();
            element.removeAttr('disabled').removeClass('disabled');
            if (element.hasClass('dropdown-item')) {
                element.closest('.dropdown-menu').removeClass('show');
            }
        },
    });
    return true;
}
