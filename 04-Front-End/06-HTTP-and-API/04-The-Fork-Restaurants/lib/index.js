const restaurantList = document.getElementById("restaurant-list");
const locationInput = document.getElementById("location");
const searchForm = document.getElementById("searchForm");

const buildSearchUrl = (category, location) => {
  let url = "https://the-fork.api.lewagon.com/api/v1/";
  url += `restaurants?category=${category}`;
  if (location) {
    url += `&location=${location}`;
  }
  return url;
};

const insertResults = (restaurants) => {
  restaurantList.innerHTML = ""; // Réinitialiser la liste

  if (restaurants.length === 0) {
    restaurantList.innerHTML = '<li class="list-group-item">Aucun restaurant trouvé pour cette catégorie et cet emplacement.</li>';
  } else {
    restaurants.forEach((restaurant) => {
      // Pour chaque restaurant dans le tableau `restaurants`, exécute le bloc de code suivant :
      // Créer un nouvel élément <li> pour chaque restaurant
      const listItem = document.createElement('li');
      // Ajouter la classe CSS 'list-group-item' à l'élément <li>
      listItem.classList.add('list-group-item');
      // Définir le texte contenu de l'élément <li> sur le nom du restaurant
      listItem.textContent = `${restaurant.name} at ${restaurant.address}`;
      // Ajouter l'élément <li> créé à la fin de la liste <ul> avec l'id 'restaurant-list'
      restaurantList.appendChild(listItem);
    });
  }
};


searchForm.addEventListener("submit", (event) => {
  event.preventDefault();
  const category = document.querySelector("input[name='category']:checked").value;
  const location = locationInput.value;
  const endpointUrl = buildSearchUrl(category, location);
  fetch(endpointUrl)
    .then(response => response.json())
    .then((data) => {
      // console.log(data);
      insertResults(data);
    });
});
