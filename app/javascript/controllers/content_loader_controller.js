import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="content-loader"
export default class extends Controller {
  static targets = ["container"];

  connect() {
    this.nextIndex = this.data.get("next-index");
  }

  insert(event) {
    event.preventDefault();

    let controller = this;
    let queryString = `?index=${this.nextIndex++}`;
    let url = this.data.get("url") + queryString;
    fetch(url)
      .then((response) => response.text())
      .then((html) => {
        controller.containerTarget.insertAdjacentHTML(
          controller.data.get("insert-location"),
          html
        )
      })
  }
}
