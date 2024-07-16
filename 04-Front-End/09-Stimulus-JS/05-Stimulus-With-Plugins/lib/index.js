/* eslint-disable import/extensions */
import { Application } from "@hotwired/stimulus";
// TODO: Import Chartjs external library
import { Chart } from "chart.js" ;
import * as Chartjs from "chart.js" ;

// TODO: Import the Stimulus Controller here
import DoughnutController from "./controllers/doughnut_controller.js";
import LineChartController from "./controllers/line_chart_controller.js";
import RadarChartController from "./controllers/radar_chart_controller.js";

window.Stimulus = Application.start();

// TODO: Register all Chartjs controllers
const controllers = Object.values(Chartjs).filter(
  (chart) => chart.id !== undefined
) ;
Chart.register(...controllers);
// TODO: Register your Stimulus Controller below

Stimulus.register("doughnut", DoughnutController);
Stimulus.register("line-chart", LineChartController);
Stimulus.register("radar-chart", RadarChartController);
