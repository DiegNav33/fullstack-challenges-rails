import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button"];

  disabled() {
    this.buttonTarget.classList.add("disabled");
    this.buttonTarget.innerText = "Bingo!";
    const audioFile = "../../sound.mp3";
    const audio = new Audio(audioFile);
    audio.play();
  }
}
