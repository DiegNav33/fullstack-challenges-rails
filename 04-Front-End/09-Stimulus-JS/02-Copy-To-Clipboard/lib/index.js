/* eslint-disable import/extensions */
import { Application } from "@hotwired/stimulus";
import CopyToClipboardController from "/lib/controllers/copy_to_clipboard_controller.js";
// TODO: Import the Stimulus Controller here

window.Stimulus = Application.start();
// TODO: Register your Stimulus Controller below
Stimulus.register("copy-to-clipboard", CopyToClipboardController);
