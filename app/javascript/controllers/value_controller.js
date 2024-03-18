import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="value"
export default class extends Controller {
  static targets = ["input"];

  update(event) { 
    event.preventDefault();

    let index = event.currentTarget.getAttribute("data-index");
    let updateValue = this.data.get("value"); 
    this.inputTargets[index].value = updateValue; 
  }
}
