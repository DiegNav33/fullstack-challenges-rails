// TODO: write your code here
document.addEventListener("DOMContentLoaded", () => {
  const buttonRestart = document.getElementById("reset-btn");
  const player1Line = document.querySelectorAll("#player1-race td");
  const player2Line = document.querySelectorAll("#player2-race td");
  let player1Position = [...player1Line].findIndex(td => td.classList.contains("active"));
  let player2Position = [...player2Line].findIndex(td => td.classList.contains("active"));
  let gameInProgress = true; // Variable de contrôle du jeu en cours
  console.log(player1Position);

  function resetGame() {
    // Réinitialisation des positions des joueurs
    player1Position = 0;
    player2Position = 0;

    // Rétablissement de la classe "active" à la première cellule pour chaque joueur
    player1Line.forEach((cell, index) => {
      if (index === player1Position) {
        cell.classList.add("active");
      } else {
        cell.classList.remove("active");
      }
    });

    player2Line.forEach((cell, index) => {
      if (index === player2Position) {
        cell.classList.add("active");
      } else {
        cell.classList.remove("active");
      }
    });

    gameInProgress = true; // Remise en jeu
  }

  buttonRestart.addEventListener("click", (event) => {
    resetGame();
  });

  document.addEventListener("keyup", (event) => {
    if (!gameInProgress) return; // Arrêter le traitement des touches si le jeu est terminé

    if (event.key === "q" || event.key === "Q") {
      if (player1Position < player1Line.length - 1) {
        player1Line[player1Position].classList.remove("active");
        player1Line[player1Position + 1].classList.add("active");
        player1Position++;
        console.log(player1Position);
      }
      if (player1Position === player1Line.length - 1) {
        setTimeout(() => {
          alert("Player 1 won !");
          gameInProgress = false;
        }, 100); // Délai pour que l'image soit bien placée
      }
    }

    if (event.key === "p" || event.key === "P") {
      if (player2Position < player2Line.length - 1) {
        player2Line[player2Position].classList.remove("active");
        player2Line[player2Position + 1].classList.add("active");
        player2Position++;
        console.log(player2Position);
      }
      if (player2Position === player2Line.length - 1) {
        setTimeout(() => {
          alert("Player 2 won !");
          gameInProgress = false;
        }, 100); // Délai pour que l'image soit bien placée
      }
    }

    if (player1Position === player1Line.length - 1 && player2Position === player2Line.length - 1) {
      gameInProgress = false;
      alert("Tied!");
    }
  });
});
