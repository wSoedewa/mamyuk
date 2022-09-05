import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reject-buttons"
export default class extends Controller {
  static targets = ["reject", "next"]

  connect() {
    console.log("hello")
  }

  delete() {
    this.rejectTargets.forEach((target) => {
      if(target.classList.contains("active")) {
        this.nextTarget.click();
        // click the next button
        target.remove();
      }
    })
  }
}
