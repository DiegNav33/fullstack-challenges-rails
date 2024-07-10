// TODO: React to a click on the button!

const button = document.getElementById("clickme");

button.addEventListener("click", (event) => {
  const audio = new Audio("../sound.mp3");
  button.classList.add("disabled");
  button.innerText = "Bingo!";
  audio.play();

  // Exemple de rétablissement après 3 secondes
  setTimeout(() => {
    button.classList.remove("disabled");
    button.innerText = "Click me!";
  }, 3000); // 3000 millisecondes (3 secondes)
});
