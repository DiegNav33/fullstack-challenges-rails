import { Chart } from "chart.js";
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["canvaRadarChart"]

  connect() {
    // console.log("Hello from radar chart Stimulus controller");

    const worldReligions = {
      "christianity" : 2382000000,
      "islam" : 1907000000,
      "atheist" : 1193000000,
      "hinduism" : 1161000000,
      "buddhism" : 506000000,
      "judaism" : 14700000,
    };

    const labels = Object.keys(worldReligions);
    const data = Object.values(worldReligions);

    new Chart(this.canvaRadarChartTarget, {
      type: 'radar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Religion population',
          data: data,
          fill: true,
          backgroundColor: 'rgba(255, 99, 132, 0.2)',
          borderColor: 'rgb(255, 99, 132)',
          pointBackgroundColor: 'rgb(255, 99, 132)',
          pointBorderColor: '#333',
          pointHoverBackgroundColor: '#333',
          pointHoverBorderColor: 'rgb(255, 99, 132)'
        }]
      }
    })
  }
}
