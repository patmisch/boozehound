import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'notice', 'alert' ];

  connect() {
    console.log('key boy 1')
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
}