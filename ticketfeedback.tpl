{if $stillopen}
    {include file="$template/includes/alert.tpl" type="warning" msg=$LANG.feedbackclosed textcenter=true}

    <p class="text-center">
        <a href="clientarea.php" class="btn btn-primary">{$LANG.returnclient}</a>
    </p>
{elseif $feedbackdone}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.feedbackprovided textcenter=true}

    <p class="text-center">{$LANG.feedbackthankyou}</p>

    <p class="text-center">
        <a href="clientarea.php" class="btn btn-primary">{$LANG.returnclient}</a>
    </p>
{elseif $success}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.feedbackreceived textcenter=true}

    <p class="text-center">{$LANG.feedbackthankyou}</p>

    <p class="text-center">
        <a href="clientarea.php" class="btn btn-primary">{$LANG.returnclient}</a>
    </p>
{else}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}

    <p>{$LANG.feedbackdesc}</p>

    <p class="text-center"><a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-success">{$LANG.feedbackclickreview}&nbsp; <i class="fas fa-arrow-right">&nbsp;</i></a></p>

    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <table class="table table-striped">
                <tr>
                    <td>{$LANG.feedbackopenedat}:</td>
                    <td><strong>{$opened}</strong></td>
                </tr>
                <tr>
                    <td>{$LANG.feedbacklastreplied}:</td>
                    <td><strong>{$lastreply}</strong></td>
                </tr>
                <tr>
                    <td>{$LANG.feedbackstaffinvolved}:</td>
                    <td><strong>{if $staffinvolvedtext}{$staffinvolvedtext}{else}{$LANG.none}{/if}</strong></td>
                </tr>
                <tr>
                    <td>{$LANG.feedbacktotalduration}:</td>
                    <td><strong>{$duration}</strong></td>
                </tr>
            </table>
        </div>
    </div>

    <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&c={$c}&feedback=1">
        <input type="hidden" name="validate" value="true" />

        {foreach from=$staffinvolved key=staffid item=staff}

            <div class="ticketfeedbackstaffcont">

                <p>{$LANG.feedbackpleaserate1} <strong>{$staff}</strong> {$LANG.feedbackhandled}:</p>

                <table class="table text-center">
                    <thead>
                        <tr>
                            <td>{$LANG.feedbackworst}</td>
                            <td>1</td>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>8</td>
                            <td>9</td>
                            <td>10</td>
                            <td>{$LANG.feedbackbest}</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>&nbsp;</td>
                            {foreach from=$ratings item=rating}
                            <td><input type="radio" name="rate[{$staffid}]" value="{$rating}"{if $rate.$staffid eq $rating} checked{/if} /></td>
                            {/foreach}
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>

                <p>{$LANG.feedbackpleasecomment1} <strong>{$staff}</strong> {$LANG.feedbackhandled}.</p>

                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <textarea name="comments[{$staffid}]" rows="4" class="form-control">{$comments.$staffid}</textarea>
                    </div>
                </div>

            </div>

        {/foreach}

        <p>{$LANG.feedbackimprove}</p>

        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <textarea name="comments[generic]" rows="4" class="form-control">{$comments.generic}</textarea>
            </div>
        </div>

        <br />

        <div class="form-group text-center">
            <input class="btn btn-primary" type="submit" name="save" value="{$LANG.clientareasavechanges}" />
            <input class="btn btn-default" type="reset" value="{$LANG.cancel}" />
        </div>

    </form>

{/if}
