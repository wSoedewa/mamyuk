import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="animate-page"
export default class extends Controller {
  static targets = ["searchOne"];

  connect() {
    document.addEventListener("turbo:before-fetch-request", (event) => {
      event.preventDefault();

      this.searchOneTarget.classList.add("animate__slideOutLeft");
      this.searchOneTarget.addEventListener("animationend", () => {
        this.searchOneTarget.classList.add("d-none");
        this.searchOneTarget.classList.remove("animate__slideOutLeft");
        event.detail.resume();
      });
    });
  }
}
