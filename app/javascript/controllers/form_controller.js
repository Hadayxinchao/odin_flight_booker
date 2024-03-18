import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger-manager"
export default class extends Controller {
  static targets = ["passengerRow", "destroyInput"]
  
  deleteRow(event) {
    event.preventDefault();
   
    let index = event.currentTarget.getAttribute("data-index");
    this.passengerRowTargets[index].classList.toggle("hidden");
    this.destroyInputTargets[index].value = 1;
  }
}
