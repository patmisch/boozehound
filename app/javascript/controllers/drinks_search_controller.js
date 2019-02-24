import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['searchText', 'content'];
  connect() {
  }

  search(e) {
    const url = new URL(this.data.get('url'));
    url.searchParams.append('q', this.searchTextTarget.value);
    fetch(url)
    .then(result => result.text())
    .then(text => {
      this.contentTarget.innerHTML = text;
    });
  }
}