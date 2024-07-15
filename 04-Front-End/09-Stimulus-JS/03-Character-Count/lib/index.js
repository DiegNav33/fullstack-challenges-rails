/* eslint-disable import/extensions */
import { Application } from "@hotwired/stimulus";
import CharacterCountController from "./controllers/character_count_controller.js";
// TODO: Import the Stimulus Controller here

window.Stimulus = Application.start();
// TODO: Register your Stimulus Controller below
Stimulus.register("character-count", CharacterCountController);
