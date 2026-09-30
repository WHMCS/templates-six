<br />

<div class="progress" id="passwordStrengthBar">
    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
        <span class="sr-only">{lang key='pwstrengthrating'}: 0%</span>
    </div>
</div>

{* minimumPasswordLength is only assigned on surfaces where WHMCS\Security\PasswordPolicy is
   actually enforced; a service/module password (e.g. modulechangepassword) is validated by the
   remote module, not this policy, so this tip must not claim a minimum that isn't checked. *}
{if $minimumPasswordLength}
    {assign var="passwordTipsText" value="{lang key=passwordtips minimum_length=$minimumPasswordLength maximum_length=$maximumPasswordLength}"}
{else}
    {assign var="passwordTipsText" value="{lang key=passwordtipsmaxonly maximum_length=$maximumPasswordLength}"}
{/if}
{* The meter now fails a password missing a required digit or letter, so the tips beside it must
   say so too - otherwise a password can turn red with no explanation of why. *}
{if $passwordRequiresNumeric}
    {assign var="passwordTipsText" value="$passwordTipsText<br />{lang key=passwordtipsrequiresnumeric}"}
{/if}
{if $passwordRequiresAlphabetic}
    {assign var="passwordTipsText" value="$passwordTipsText<br />{lang key=passwordtipsrequiresalphabetic}"}
{/if}
{if file_exists("templates/$template/includes/alert.tpl")}
    {include file="$template/includes/alert.tpl" type="info" msg=$passwordTipsText}
{elseif file_exists("templates/six/includes/alert.tpl")}
    {include file="six/includes/alert.tpl" type="info" msg=$passwordTipsText}
{/if}

<script type="text/javascript">
// maximumLength() is nullable (no rule in the policy carries a maximum), so this must not
// interpolate straight into a numeric literal - null would emit "var maximumPasswordLength = ;",
// a syntax error that breaks every script on this page, including validatePassword2() below.
var maximumPasswordLength = {if $maximumPasswordLength}{$maximumPasswordLength}{else}null{/if};
// minimumPasswordLength, passwordRequiresNumeric and passwordRequiresAlphabetic are assigned
// only where WHMCS\Security\PasswordPolicy actually governs this field (see the comment above);
// 0/false here means "not checked client-side", matching the tips text falling back to
// maximum-only above.
var minimumPasswordLength = {if $minimumPasswordLength}{$minimumPasswordLength}{else}0{/if};
var passwordRequiresNumeric = {if $passwordRequiresNumeric}true{else}false{/if};
var passwordRequiresAlphabetic = {if $passwordRequiresAlphabetic}true{else}false{/if};

function passwordMeetsPolicy(password) {
    return (!minimumPasswordLength || password.length >= minimumPasswordLength)
        && (maximumPasswordLength === null || password.length <= maximumPasswordLength)
        && (!passwordRequiresNumeric || /[0-9]/.test(password))
        && (!passwordRequiresAlphabetic || /[a-zA-Z]/.test(password));
}

jQuery("#inputNewPassword1").keyup(function() {
{if isset($pwStrengthErrorThreshold)}
    var pwStrengthErrorThreshold = {$pwStrengthErrorThreshold};
{else}
    var pwStrengthErrorThreshold = 50;
{/if}
{if isset($pwStrengthWarningThreshold)}
    var pwStrengthWarningThreshold = {$pwStrengthWarningThreshold};
{else}
    var pwStrengthWarningThreshold = 75;
{/if}

    var $newPassword1 = jQuery("#newPassword1");
    var pw = jQuery("#inputNewPassword1").val();
    var pwlength=(pw.length);
    if(pwlength>5)pwlength=5;
    var numnumeric=pw.replace(/[0-9]/g,"");
    var numeric=(pw.length-numnumeric.length);
    if(numeric>3)numeric=3;
    var symbols=pw.replace(/\W/g,"");
    var numsymbols=(pw.length-symbols.length);
    if(numsymbols>3)numsymbols=3;
    var numupper=pw.replace(/[A-Z]/g,"");
    var upper=(pw.length-numupper.length);
    if(upper>3)upper=3;
    var pwstrength=((pwlength*10)-20)+(numeric*10)+(numsymbols*15)+(upper*10);
    if (pwstrength < 0) pwstrength = 0;
    if (pwstrength > 100) pwstrength = 100;

    $newPassword1.removeClass('has-error has-warning has-success');
    jQuery("#inputNewPassword1").next('.form-control-feedback').removeClass('glyphicon-remove glyphicon-warning-sign glyphicon-ok');
    jQuery("#passwordStrengthBar .progress-bar").removeClass("progress-bar-danger progress-bar-warning progress-bar-success").css("width", pwstrength + "%").attr('aria-valuenow', pwstrength);
    jQuery("#passwordStrengthBar .progress-bar .sr-only").html('{lang|addslashes key='pwstrengthrating'}: ' + pwstrength + '%');
    if ((pwstrength < pwStrengthErrorThreshold) || !passwordMeetsPolicy(pw)) {
        $newPassword1.addClass('has-error');
        jQuery("#inputNewPassword1").next('.form-control-feedback').addClass('glyphicon-remove');
        jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-danger");
    } else if (pwstrength < pwStrengthWarningThreshold) {
        $newPassword1.addClass('has-warning');
        jQuery("#inputNewPassword1").next('.form-control-feedback').addClass('glyphicon-warning-sign');
        jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-warning");
    } else {
        $newPassword1.addClass('has-success');
        jQuery("#inputNewPassword1").next('.form-control-feedback').addClass('glyphicon-ok');
        jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-success");
    }
    validatePassword2();
});

function validatePassword2() {
    var password1 = jQuery("#inputNewPassword1").val();
    var password2 = jQuery("#inputNewPassword2").val();
    var $newPassword2 = jQuery("#newPassword2");

    if (password2 && password1 !== password2) {
        $newPassword2.removeClass('has-success')
            .addClass('has-error');
        jQuery("#inputNewPassword2").next('.form-control-feedback').removeClass('glyphicon-ok').addClass('glyphicon-remove');
        jQuery("#inputNewPassword2Msg").html('<p class="help-block" id="nonMatchingPasswordResult">{$LANG.pwdoesnotmatch|escape}</p>');
        {if !isset($noDisable)}jQuery('input[type="submit"]').attr('disabled', 'disabled');{/if}
    } else {
        // Submit stays gated on max-length only, matching pre-existing behavior: a shorter/
        // non-numeric/non-alphabetic password is flagged as an error above (via
        // passwordMeetsPolicy in the keyup handler) but is still submittable, so the server's
        // own PasswordPolicy rejection message is what the user ultimately sees for those rules.
        if (password2 && (maximumPasswordLength === null || password1.length <= maximumPasswordLength)) {
            $newPassword2.removeClass('has-error')
                .addClass('has-success');
            jQuery("#inputNewPassword2").next('.form-control-feedback').removeClass('glyphicon-remove').addClass('glyphicon-ok');
            {if !isset($noDisable)}jQuery('.main-content input[type="submit"]').removeAttr('disabled');{/if}
        } else {
            $newPassword2.removeClass('has-error has-success');
            jQuery("#inputNewPassword2").next('.form-control-feedback').removeClass('glyphicon-remove glyphicon-ok');
        }
        jQuery("#inputNewPassword2Msg").html('');
    }
}

jQuery(document).ready(function(){
    {if !isset($noDisable)}jQuery('.using-password-strength input[type="submit"]').attr('disabled', 'disabled');{/if}
    jQuery("#inputNewPassword2").keyup(function() {
        validatePassword2();
    });
});

</script>
