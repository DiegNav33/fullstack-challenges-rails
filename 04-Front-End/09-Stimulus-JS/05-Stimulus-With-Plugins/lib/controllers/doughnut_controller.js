import { Chart } from "chart.js";
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["canvaDoughnut"]

  connect() {
    const worldPopulation = {
      "men": 504,
      "women": 496
    }

    const labels = Object.keys(worldPopulation);
    const data = Object.values(worldPopulation);

    new Chart(this.canvaDoughnutTarget, {
      type: 'doughnut',
      data: {
        labels: labels,
        datasets: [{
          label: 'Gender ratio',
          data: data,
          backgroundColor: [
          'rgb(54, 162, 235)',
          'rgb(255, 99, 132)'
          ],
          hoverOffset: 5
        }]
      }
    })
  }
}
