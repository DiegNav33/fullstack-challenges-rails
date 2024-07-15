/* eslint-disable import/extensions */
import { Application } from "@hotwired/stimulus";
import CheckAllCheckboxesController from "./controllers/check_all_checkboxes_controller.js";

// TODO: Import the Stimulus Controller here

window.Stimulus = Application.start();
// TODO: Register your Stimulus Controller below

Stimulus.register("check-all-checkboxes", CheckAllCheckboxesController);
