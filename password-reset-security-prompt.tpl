<p>{$LANG.pwresetsecurityquestionrequired}</p>

<form method="post" action="{routePath('password-reset-security-verify')}"  class="form-stacked">
    <div class="form-group">
        <label for="inputAnswer">{$securityQuestion}</label>
        <input type="text" name="answer" class="form-control" id="inputAnswer" autofocus>
    </div>

    <div class="form-group text-center">
        <button type="submit" class="btn btn-primary">{$LANG.pwresetsubmit}</button>
    </div>

</form>
