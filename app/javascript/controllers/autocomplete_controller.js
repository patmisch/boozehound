import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['input', 'content', 'dropdown'];

  search(e) {
    fetch(`${this.data.get('searchUrl')}?q=${e.target.value}`)
    .then(result => result.text())
    .then(text => {
      if (text) {
        this.dropdownTarget.classList.add('is-active');
      } else {
        this.dropdownTarget.classList.remove('is-active');
      }
      this.contentTarget.innerHTML = text;
    });
  }

  selected(e) {
    e.preventDefault();
    this.inputTarget.value = e.target.innerHTML;
    const dataKey = this.data.get('saveKey');
    this.data.set(dataKey, e.target.value);
    this.dropdownTarget.classList.remove('is-active');

  }
}