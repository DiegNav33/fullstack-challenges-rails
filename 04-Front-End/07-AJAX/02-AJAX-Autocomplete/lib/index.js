// TODO: Autocomplete the input with AJAX calls.
const url = "https://dictionary.lewagon.com/autocomplete/";
const ul = document.getElementById("results");
const input = document.getElementById("search");

const fetchDatas = (event) => {
  const inputValue = input.value.trim();

  if (!inputValue) {
    // Si l'input est vide, vider la liste et sortir de la fonction
    ul.innerHTML = "";
    return;
  }

  const urlBuilt = `${url}${inputValue}`;
  fetch(urlBuilt)
  .then(response => response.json())
  .then(data => {
    console.log(data);
    if (data.words.length <= 0) {
      ul.innerText = "Sorry no words found!";
    } else {
      const words = data.words.slice(0, 5); // Prend les 5 premiers éléments du tableau words
      ul.innerHTML = "";
      words.forEach((word) => {
        const li = document.createElement("li");
        li.innerText = word;
        ul.appendChild(li);
      });
    }
  });
};

input.addEventListener("keyup", fetchDatas);
