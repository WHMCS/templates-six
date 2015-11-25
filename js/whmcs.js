/**
 * Javascript functions utilised by the client area templates.
 *
 * @file WHMCS Six Theme Javascript Library
 * @copyright Copyright 2015 WHMCS Limited
 */

jQuery(document).ready(function() {

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

    // Default catch for all other popovers
    jQuery('[data-toggle="popover"]').popover({
        html: true
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
        var id = jQuery(this).attr('id').replace("Link", "");
        if (jQuery("#" + id).length != 0) {
            var action = jQuery("#domainForm").attr("action");
            jQuery("#domainForm").attr("action", action + "#" + id);
        }
        jQuery("#bulkaction").val(id);
        jQuery("#domainForm").submit();
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
        jQuery.post("clientarea.php", jQuery("#frmSingleSignOn").serialize());
    });
});

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
    jQuery.post(
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
 * Two-Factor Authentication dialog submit handler.
 */
function dialogSubmit() {
    jQuery('div#twofaactivation form').attr('method', 'post');
    jQuery('div#twofaactivation form').attr('action', 'clientarea.php?action=security');
    jQuery('div#twofaactivation form').attr('onsubmit', '');
    jQuery('div#twofaactivation form').submit();
    return true;
}

/**
 * Fetch load and uptime for a given server.
 *
 * @param {number} num Server Id
 */
function getStats(num) {
    jQuery.post('serverstatus.php', 'getstats=1&num=' + num, function(data) {
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
    jQuery.post('serverstatus.php', 'ping=1&num=' + num + '&port=' + port, function(data) {
        jQuery("#port" + port + "_" + num).html(data);
    });
}

/**
 * Fetch automated knowledgebase suggestions for ticket content.
 */
function getticketsuggestions() {
    currentcheckcontent = jQuery("#message").val();
    if (currentcheckcontent != lastcheckcontent && currentcheckcontent != "") {
        jQuery.post("submitticket.php", { action: "getkbarticles", text: currentcheckcontent },
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
    jQuery("#" + containerId).find("form:first").submit();
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

/**
 * Used to toggle display of editable billing address fields.
 */
function editBillingAddress() {
    jQuery("#billingAddressSummary").hide();
    jQuery(".cc-billing-address").hide().removeClass('hidden').fadeIn();
}

/**
 * Show new credit card input fields.
 */
function showNewCardInputFields() {
    if (jQuery(".cc-details").hasClass("hidden")) {
        jQuery(".cc-details").hide().removeClass("hidden");
    }
    jQuery(".cc-details").slideDown();
    jQuery("#btnEditBillingAddress").removeAttr("disabled");
}

/**
 * Hide new credit card input fields.
 */
function hideNewCardInputFields() {
    jQuery(".cc-billing-address").slideUp();
    jQuery(".cc-details").slideUp();
    jQuery("#btnEditBillingAddress").attr("disabled", "disabled");
    if (jQuery("#billingAddressSummary").hasClass('hidden')) {
        jQuery("#billingAddressSummary").hide().removeClass('hidden').slideDown();
    } else {
        jQuery("#billingAddressSummary").slideDown();
    }
}

/**
 * Get automatic knowledgebase suggestions for support ticket message.
 */
var lastTicketMsg;
function getTicketSuggestions() {
    var userMsg = jQuery("#inputMessage").val();
    if (userMsg != lastTicketMsg && userMsg != '') {
        jQuery.post("submitticket.php", { action: "getkbarticles", text: userMsg },
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
 * Confirm that the contact should be deleted and redirect.
 *
 * @param {string} confirmQuestion
 * @param {int} contactId
 */
function deleteContact(confirmQuestion, contactId)
{
    if (confirm(confirmQuestion)) {
        window.location = 'clientarea.php?action=contacts&delete=true&id=' + contactId + '&token=' + csrfToken;
    }
}
