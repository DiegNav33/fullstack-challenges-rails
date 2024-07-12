const apiKey = "pk.eyJ1IjoiZGllZ25hdiIsImEiOiJjbHlpNmIyNzYwYmV4MmpyNTg1eDR3OHJvIn0.AjvTYE3bswFA7HMEc9e23g";

const showCoordinates = (longitude, latitude, fullAddress = "") => {
  const coordinatesDisplay = document.getElementById('coordinates-display');
  coordinatesDisplay.innerHTML = `${fullAddress} || Latitude: ${latitude}, Longitude: ${longitude}`;
  document.title = `Geocoder - ${fullAddress}`;
};

const updateMap = (lng, lat) => {
  mapboxgl.accessToken = apiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/dark-v10',
    center: [lng, lat],
    zoom: 13
  });

  new mapboxgl.Marker()
    .setLngLat([lng, lat])
    .addTo(map);
};

const form = document.getElementById('geocode-form');
form.addEventListener('submit', (event) => {
  event.preventDefault();
  const userInput = document.getElementById('address-input').value.trim();
  const url = `https://api.mapbox.com/search/geocode/v6/forward?q=${encodeURIComponent(userInput)}&access_token=${apiKey}`;

  fetch(url)
    .then(response => response.json())
    .then(data => {
      if (data.features && data.features.length > 0) {
        const coordinates = data.features[0].properties.coordinates;
        const longitude = coordinates.longitude;
        const latitude = coordinates.latitude;
        const fullAddress = data.features[0].properties.full_address;

        showCoordinates(longitude, latitude, fullAddress);
        updateMap(longitude, latitude);
      } else {
        const coordinatesDisplay = document.getElementById('coordinates-display');
        coordinatesDisplay.textContent = 'Coordinates not found';
      }
    })
    .catch(error => {
      console.error('Error fetching geocoding data:', error);
      alert('Error fetching coordinates');
    });
});

mapboxgl.accessToken = apiKey;
const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/dark-v10',
  center: [2.61878695312962, 47.8249046208979],
  zoom: 5
});

if (navigator.geolocation) {
  navigator.geolocation.getCurrentPosition((position) => {
    const lng = position.coords.longitude;
    const lat = position.coords.latitude;
    showCoordinates(lng, lat);
    updateMap(lng, lat);
  }, (error) => {
    console.error('Error obtaining geolocation:', error);
  });
} else {
  console.error('Geolocation is not supported by this browser.');
}
