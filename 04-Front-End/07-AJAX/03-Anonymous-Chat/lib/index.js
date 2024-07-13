const batch = 1; // change to your own batch id
const baseUrl = "https://chat.api.lewagon.com/";
const form = document.getElementById("comment-form");
const buttonRefresh = document.getElementById("refresh");
const author = document.getElementById("your-name");
const message = document.getElementById("your-message");
const ul = document.querySelector("ul");

const newMessages = (event) => {
  event.preventDefault();
  const authorValue = author.value;
  const messageValue = message.value;
  const body = { author: authorValue, content: messageValue };
  const urlBuilt = `${baseUrl}/${batch}/messages`;

  fetch(urlBuilt, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(body)
  })
  .then(response => response.json())
  .then(data => {
    author.value = "";
    message.value = "";
    fetchMessages();
  });
;}

const fetchMessages = (event) => {
  // event.preventDefault();
  const urlBuilt = `${baseUrl}/${batch}/messages`;
  fetch(urlBuilt)
  .then(response => response.json())
  .then(data => {
    const messages = data.messages;
    // Vider la liste des messages avant de la remplir avec les nouveaux messages
    ul.innerHTML = '';

    messages.forEach((element) => {
      const content = element.content;
      const authorPost = element.author;
      const dateCreated = new Date(element.created_at); // Convertit la chaîne en objet Date
      const dateNow = new Date(); // Obtient l'heure actuelle
      const diffMs = dateNow - dateCreated; // Différence en millisecondes
      const diffMinutes = Math.round(diffMs / (1000 * 60)); // Convertit en minutes arrondies
      const messagePosted = `${diffMinutes} minutes ago`;
      const li = document.createElement("li");
      li.innerHTML = `<p>Author: ${authorPost}</p><p>Message: ${content}</p> <p>(posted <span class="date">${messagePosted}</span>)</p>`;
      ul.prepend(li);
    });
  });
};

setInterval(fetchMessages, 2000);

document.addEventListener("DOMContentLoaded", fetchMessages);

form.addEventListener("submit", newMessages);
