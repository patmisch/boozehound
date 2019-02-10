import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['purchaseSizeSelect', 'selectedDrink', 'hiddenForm']

  drinkSelected(e) {
    this.hiddenFormTarget.classList.remove('is-hidden');
    const url = this.data.get('purchaseSizeUrl');
    console.log(url);
    fetch(`${url}?drink_id=${this.selectedDrinkTarget.value}`)
      .then(result => result.text())
      .then(html => {
        this.purchaseSizeSelectTarget.innerHTML = html;
      });
  }
}