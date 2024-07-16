import { Chart } from "chart.js";
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["canvaLineChart"]

  connect() {
    console.log("Hello from line chart Stimulus controller");

    const worldPopulationGrowth = {
      "2023": 8045311447,
      "2022": 7975105156,
      "2021": 7909295151,
      "2020": 7840952880,
      "2019": 7764951032,
      "2018": 7683789828,
      "2017": 7599822404,
      "2016": 7513474238,
      "2015": 7426597537,
      "2014": 7339013419,
      "2013": 7250593370,
      "2012": 7161697921,
      "2011": 7073125425,
      "2010": 6985603105
    };

    const labels = Object.keys(worldPopulationGrowth);
    const data = Object.values(worldPopulationGrowth);

    new Chart(this.canvaLineChartTarget, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [{
          label: 'World population',
          data: data,
          fill: true,
          borderColor: 'rgb(75, 192, 192)',
          tension: 0.1
        }]
      }
    })
  }
}
