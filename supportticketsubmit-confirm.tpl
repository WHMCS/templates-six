<br />

<div class="row">
    <div class="col-sm-10 col-sm-offset-1">

        <div class="alert alert-success text-center">
            <strong>
                {$LANG.supportticketsticketcreated}
                <a id="ticket-number" href="viewticket.php?tid={$tid}&amp;c={$c}" class="alert-link">#{$tid}</a>
            </strong>
        </div>

        <div class="row">
            <div class="col-xs-10 col-xs-offset-1">
                <p>{$LANG.supportticketsticketcreateddesc}</p>
            </div>
        </div>

        <br />

        <p class="text-center">
            <a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-default">
                {$LANG.continue}
                <i class="fa fa-arrow-circle-right"></i>
            </a>
        </p>

        <br />
        <br />
        <br />

    </div>
</div>
