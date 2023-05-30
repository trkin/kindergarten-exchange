import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("turbo:load", function() {
  initMap();
});


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: 45.2457395, lng: 19.8291528},
    zoom: 13,
    draggable: true
  });

  
  var mapElement = document.querySelector("#map");
  console.log(mapElement.dataset.kindergartens)
  
  var kindergartensData = JSON.parse(mapElement.dataset.kindergartens);
  
  kindergartensData.forEach(kindergarten => {
            var marker = new google.maps.Marker({
              position: { lat: parseFloat(kindergarten.latitude), lng: parseFloat(kindergarten.longitude) },
              map: map,
              title: kindergarten.name
            });

            // Store the original position of the marker
            var originalPosition = marker.getPosition();

            // Offset to move the marker up on hover
            var hoverOffset = 0.0003; // Adjust this value as needed

            // Add mouseover event listener
            marker.addListener('mouseover', function() {
              // Move the marker up by the offset
              var newPosition = {
                lat: originalPosition.lat() + hoverOffset,
                lng: originalPosition.lng()
              };
              marker.setPosition(newPosition);
            });

            marker.addListener('mouseout', function() {
            marker.setPosition(originalPosition);
            });


            marker.addListener('click', function() {
            var selectField = document.getElementById('selectField');
            selectField.value = kindergarten.id; // Replace with the ID value you want to set
            });

            var content = '<h3>' + kindergarten.name + '</h3>' +
              '<p>' + kindergarten.address + '</p>';

            var infoWindow = new google.maps.InfoWindow({
              content: content
            });

            marker.addListener('mouseover', function() {
              infoWindow.open(map, marker);
            });

            marker.addListener('mouseout', function() {
              infoWindow.close();
            });

          });    
}
