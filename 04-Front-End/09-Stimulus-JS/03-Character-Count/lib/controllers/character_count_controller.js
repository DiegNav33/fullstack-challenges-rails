import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "counter"]
  static values = {
    limit: Number
  }

  updateCounter() {
    if (this.inputTarget.value.length > this.limitValue) {
      this.counterTarget.classList.add("text-danger");
      this.counterTarget.innerText = `${this.inputTarget.value.length} characters || ${this.inputTarget.value.length - this.limitValue} ${(this.inputTarget.value.length - this.limitValue) > 1 ? 'characters' : 'character'} out of range`;
    } else {
      this.counterTarget.classList.remove("text-danger");
      this.counterTarget.classList.add("text-success");
      this.counterTarget.innerText = `${this.inputTarget.value.length} ${this.inputTarget.value.length > 1 ? 'characters' : 'character'} || ${this.limitValue - this.inputTarget.value.length} ${(this.limitValue - this.inputTarget.value.length) > 1 ? 'characters' : 'character'} left`;
    }
  };
}
