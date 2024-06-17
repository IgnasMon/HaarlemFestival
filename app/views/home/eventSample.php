<div class="row">
    <div class="col-sm eventcontent">
        <div>
            <h1 class="header">
                <?= $title ?>
            </h1>
            <p class="eventDescription"><?= nl2br($text->text) ?></p>
        </div>
        <button class="homeButton">Learn More About The Event</button>
    </div>
    <div class="col-sm">
        <img class="eventImage" src="<?=$image?>">
    </div>
</div>
