import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['input', 'content', 'dropdown', 'hiddenValue'];

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
    const event = new Event('change');
    this.hiddenValueTarget.value = e.target.value;
    this.hiddenValueTarget.dispatchEvent(event);
    this.inputTarget.value = e.target.innerHTML;
    this.dropdownTarget.classList.remove('is-active');
  }
}