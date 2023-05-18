// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


  document.addEventListener("DOMContentLoaded", function() {
    initMap();
  });
  function initMap(){
    var map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: 45.2657395, lng: 19.8291528},
      zoom: 13,
      draggable: true
    });
     // Fetch the kindergarten data from the server
    fetch('/kindergarten.json')
      .then(response => response.json())
      .then(data => {
        // Loop through each kindergarten
        data.forEach(kindergarten => {
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

          // Add mouseout event listener
          marker.addListener('mouseout', function() {
            // Restore the marker's original position
            marker.setPosition(originalPosition);
          });

          // Add click event listener to marker
          marker.addListener('click', function() {
            // Set the select field value to the selected kindergarten's name
            selectField.value = kindergarten.name;
          });

          // Create the infoWindow content
          var content = '<h3>' + kindergarten.name + '</h3>' +
          '<p>' + kindergarten.address + '</p>';

          // Create the infoWindow
          var infoWindow = new google.maps.InfoWindow({
          content: content
          });
          // Show the InfoWindow on marker hover
          marker.addListener('mouseover', function() {
            infoWindow.open(map, marker);
          });

          // Hide the InfoWindow on marker mouseout
          marker.addListener('mouseout', function() {
            infoWindow.close();
          });
        });
      });
  }