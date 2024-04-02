<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
      integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY="
      crossorigin=""/>

<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo="
        crossorigin=""></script>
<div class="mapContainer">
    <div id="mapBackground">
        <div id="map"></div>
        <div class="row locationNames">
            <?php
            $locations = $service->getAllHistoryLocations();
            foreach ($locations as $location) {
                ?>
                <div class="col-6">
                    <p><?= $location->id ?>. <?= $location->name ?></p>

                </div>
            <?php } ?>

        </div>
    </div>
</div>

<script>
    var map = L.map('map').setView([52.38119320033884, 4.636915687632547], 15);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);
    <?php
        $locations = $service->getAllHistoryLocations();

        foreach ($locations as $location) {
            ?>
            var marker = L.marker([<?= $location->latitude ?>, <?= $location->longitude ?>]).addTo(map);
            marker.on('click', onMarkerClick);
        <?php }
    ?>

    function onMarkerClick(e) {
        marker.setOpacity(10);
    }
</script>