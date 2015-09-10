<div class="logincontainer">

    {include file="$template/includes/pageheader.tpl" title=$LANG.pwreset}

    {if $loggedin}
        {include file="$template/includes/alert.tpl" type="error" msg=$LANG.noPasswordResetWhenLoggedIn textcenter=true}
    {else}
        {if $success}

            {include file="$template/includes/alert.tpl" type="success" msg=$LANG.pwresetvalidationsent textcenter=true}

            <p>{$LANG.pwresetvalidationcheckemail}</p>

        {else}

            {if $errormessage}
                {include file="$template/includes/alert.tpl" type="error" msg=$errormessage textcenter=true}
            {/if}

            {if $securityquestion}

                <p>{$LANG.pwresetsecurityquestionrequired}</p>

                <form method="post" action="pwreset.php"  class="form-stacked">
                    <input type="hidden" name="action" value="reset" />
                    <input type="hidden" name="email" value="{$email}" />

                    <div class="form-group">
                        <label for="inputAnswer">{$securityquestion}</label>
                        <input type="text" name="answer" class="form-control" id="inputAnswer" autofocus>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">{$LANG.pwresetsubmit}</button>
                    </div>

                </form>

            {else}

                <p>{$LANG.pwresetemailneeded}</p>

                <form method="post" action="{$systemsslurl}pwreset.php" role="form">
                    <input type="hidden" name="action" value="reset" />

                    <div class="form-group">
                        <label for="inputEmail">{$LANG.loginemail}</label>
                        <input type="email" name="email" class="form-control" id="inputEmail" placeholder="{$LANG.enteremail}" autofocus>
                    </div>

                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary">{$LANG.pwresetsubmit}</button>
                    </div>

                </form>

            {/if}

        {/if}
    {/if}

</div>
