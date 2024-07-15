import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkAllbox", "otherBox"]

  connect() {
    console.log("controller connected!");
  }

  checkAll(event) {
    this.otherBoxTargets.forEach((box) => {
      box.checked = event.currentTarget.checked;
      // box.checked = this.checkAllboxTarget.checked;  => sans event
      console.log("ok");
    });
  }
}
