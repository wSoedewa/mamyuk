import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reject-buttons"
export default class extends Controller {
  static targets = ["reject", "next", "more"]

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

    if(this.rejectTargets.length==0) {
      console.log("habis")
      this.moreTarget.classList.remove("d-none")
      // Target the arrow buttons getElementById
      // Add d-none
    }
  }
}
