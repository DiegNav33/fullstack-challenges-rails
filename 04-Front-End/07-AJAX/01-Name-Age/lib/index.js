const apiUrl = `https://api.dictionaryapi.dev/api/v2/entries/en/`;
const definition = document.getElementById("definition");
const spinner = document.getElementById("spinner");
const displayDefinition = (event) => {
  event.preventDefault();
  const word = document.getElementById("word").value.trim();
  const apiUrlBuilt = `${apiUrl}${word}`;

  // Affichage du spinner pendant le chargement des données
  spinner.style.display = "block";

  // TODO: Display your word's definition with an AJAX call instead of the console.log()
  fetch(apiUrlBuilt)
  .then(response => response.json())
  .then(data => {
    spinner.style.display = "none"; // Cacher le spinner après chargement
    if (data.length > 0) {
      console.log(data);
      definition.innerText = data[0].meanings[0].definitions[0].definition;
      console.log(definition);
    } else {
      definition.innerText = "Sorry word not found !";
    }
  })
  .catch(error => {
    spinner.style.display = "none"; // Cacher le spinner en cas d'erreur
    console.error('Error fetching definition:', error);
    definition.innerText = "An error occurred while fetching the definition.";
  });
};

const form = document.getElementById("fetch-word");
form.addEventListener("submit", displayDefinition);
