// TODO: Call the Weather API when the form is submitted
const icon = document.getElementById("icon");
const temperature = document.getElementById("temperature");
const description = document.getElementById("description");
const city = document.getElementById("city");
const country = document.getElementById("country");
const date = document.getElementById("date");
const input = document.getElementById("input");
const currentLocation = document.getElementById("currentLocation");
const apiKey = "89d0c3c8f30a297e9aa9ae25a5214902";

const cardDatas = (data) => {
  console.log(data);
  icon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
  temperature.innerText = `${Math.round(data.main.temp)}°C`;
  description.innerText = data.weather[0].description;
  city.innerText = data.name;
  country.innerText = `, ${data.sys.country}`;
  const today = new Date(); // Crée un nouvel objet Date pour l'heure actuelle
  // Calcule le décalage horaire en millisecondes (timezone est en secondes)
  const localOffsetMillis = (data.timezone + today.getTimezoneOffset() * 60) * 1000;
  // Crée une nouvelle date locale en ajoutant le décalage horaire
  const localDate = new Date(today.getTime() + localOffsetMillis);
  // Options de formatage pour la méthode toLocaleDateString
  const options = {
    weekday: 'long', // Affiche le jour de la semaine complet
    month: 'long', // Affiche le mois complet
    day: 'numeric', // Affiche le jour du mois
    hour: 'numeric', // Affiche l'heure
    minute: 'numeric' // Affiche les minutes
  };
  // Formate la date locale en une chaîne de caractères
  const formattedDate = localDate.toLocaleDateString("en-US", options);
  // Met à jour l'élément HTML avec la date formatée
  date.innerText = formattedDate;
};

const fetchWeather = (event) => {
  event.preventDefault();
  const cityInput = input.value.trim();
  const url = `https://api.openweathermap.org/data/2.5/weather?q=${cityInput}&units=metric&appid=${apiKey}`;

  fetch(url)
    .then(response => response.json())
    .then((data) => {
      if (data.cod !== 200) {
        alert("City not found. Please try again.");
        return;
      }
      cardDatas(data);
    });
};

const fetchCurrentPosition = (event) => {
  event.preventDefault();
  navigator.geolocation.getCurrentPosition((data) => {
    const lat = data.coords.latitude;
    const lon = data.coords.longitude;
    console.log(data);

    const urlWithCo = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&units=metric&appid=${apiKey}`;
    fetch(urlWithCo)
      .then(response => response.json())
      .then((data) => {
        cardDatas(data);
      });
  });
};

const form = document.querySelector("form");
form.addEventListener("submit", fetchWeather);
currentLocation.addEventListener("click", fetchCurrentPosition);

// Fetch weather data by current location on page load
document.addEventListener("DOMContentLoaded", fetchCurrentPosition);
