import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['newDrinkContainer']

  typeSelected(e) {
    console.log(e.target.value);

    fetch(`${this.data.get('url')}?category_id=${e.target.value}`)
    .then(response => response.text())
    .then(html => {
      this.newDrinkContainerTarget.innerHTML = html
    });
  }

}