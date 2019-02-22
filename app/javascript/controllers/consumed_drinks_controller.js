import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [
    'purchaseSizeSelect',
    'selectedDrink',
    'hiddenForm',
    'selectField',
    'askLaterForm',
    'askLater',
  ]

  connect() {
    if (this.askLaterForm) {
      this.optionSelected();
    }
  }

  drinkSelected(e) {
    if(this.selectedDrinkTarget.value) {
      this.hiddenFormTarget.classList.remove('is-hidden');
      const url = this.data.get('purchaseSizeUrl');
      fetch(`${url}?drink_id=${this.selectedDrinkTarget.value}`)
        .then(result => result.text())
        .then(html => {
          this.purchaseSizeSelectTarget.innerHTML = html;
        });
    }
  }

  optionSelected(e) {
    const askLater = this.selectFieldTargets.find(item => item.value == -1);
    if (askLater) {
      this.askLaterFormTarget.classList.remove('is-hidden');
      this.askLaterTarget.value = true;
    } else {
      this.askLaterFormTarget.classList.add('is-hidden');
      this.askLaterTarget.value = false;
    }
  }
}