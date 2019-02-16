import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'notice', 'alert', 'hamburger', 'menu' ];

  connect() {
  }

  hideNotice() {
    this.hideElement(this.noticeTarget);
  }

  hideAlert() {
    this.hideElement(this.alertTarget);
  }

  hideElement(element) {
    console.log(element);
    element.classList.add('is-hidden');
  }

  toggleMenu() {
    this.hamburgerTarget.classList.toggle('is-active');
    this.menuTarget.classList.toggle('is-active');
  }
}