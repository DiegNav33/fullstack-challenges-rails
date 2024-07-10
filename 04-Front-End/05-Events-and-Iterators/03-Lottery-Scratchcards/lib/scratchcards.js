// TODO: Write your gambling application here.
document.addEventListener("DOMContentLoaded", () => {
  const scratchCards = document.querySelectorAll(".scratchcard");
  let balance = parseInt(document.getElementById("balance").innerText, 10);
  scratchCards.forEach((card) => {
    card.addEventListener("click", (event) => {
      if (balance <= 0) {
        document.getElementById("footer").innerText = "Out of money!";
        alert("GAME OVER!\nYou can refresh the page and try again.");
      } else {
        if (card.dataset.scratched === "true") {
          alert("This ticket has already been scratched!");
          return; // Exit if the card is already scratched
        }
        const priceForEachTicket = 10;
        const amountGained = parseInt(card.dataset.amount, 10);
        const cardScratched = card.dataset.scratched = "true";
        console.log(amountGained);
        card.innerText = card.dataset.amount;
        balance -= priceForEachTicket;
        balance += amountGained;
        card.dataset.scratched = cardScratched;
        console.log(card.dataset.scratched = cardScratched);
        document.getElementById("balance").innerText = balance.toString();
        console.log(balance);
      }
    });
  });
});
