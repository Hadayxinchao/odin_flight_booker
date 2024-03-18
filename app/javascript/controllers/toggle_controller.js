import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["container"]

  toggle(event) {
    event.preventDefault();

    let index = event.currentTarget.getAttribute("data-index");
    let toggleClass = this.data.get("class");
    this.containerTargets[index].classList.toggle(toggleClass)
  }
}
