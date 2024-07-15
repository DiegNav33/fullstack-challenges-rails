import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "input"];
  static values = {
    feedbackText: String
  }

  // connect() {
  //   console.log("controller connected!");
  // };

  copy(event) {
    const inputValue = this.inputTarget.value;
    // Copier le texte dans le presse-papiers
    navigator.clipboard.writeText(inputValue)
      .then(() => {
        // Désactiver le bouton
        this.buttonTarget.setAttribute("disabled", "");
        // Changer le texte du bouton
        this.buttonTarget.innerText = this.feedbackTextValue;
      })
      .catch(err => {
        console.error('Could not copy text: ', err);
      });
  };
}
