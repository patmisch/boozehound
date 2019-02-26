import { Controller } from "stimulus";
import fontawesome from '@fortawesome/fontawesome';
import faTwitter from '@fortawesome/fontawesome-free-brands/faTwitter'
``

export default class extends Controller {
  static targets = [ 'notice', 'alert', 'hamburger', 'menu' ];
  initialize() {
    fontawesome.library.add(faTwitter);
  }
  connect() {
  }

  hideNotice() {
    this.hideElement(this.noticeTarget);
  }

  hideAlert() {
    this.hideElement(this.alertTarget);
  }

  hideElement(element) {
    element.classList.add('is-hidden');
  }

  toggleMenu() {
    this.hamburgerTarget.classList.toggle('is-active');
    this.menuTarget.classList.toggle('is-active');
  }
}