import { Application } from "@hotwired/stimulus";

import EventListenerController from "./controllers/event_listener_controller.js";

window.Stimulus = Application.start();
window.Stimulus.register("event-listener", EventListenerController);
