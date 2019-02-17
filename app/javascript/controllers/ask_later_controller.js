import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['modal']
  connect() {
    console.log('hey');
  }

  showModal(e) {
    e.preventDefault();
    console.log('show')
    this.modalTarget.classList.add('is-active');
  }

  closeModal(e) {
    e.preventDefault()
    this.modalTarget.classList.remove('is-active');
  }
}