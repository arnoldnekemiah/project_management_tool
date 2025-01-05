import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    this.hideForm()
  }

  showForm() {
    this.formTarget.classList.remove("hidden")
  }

  hideForm() {
    this.formTarget.classList.add("hidden")
  }
} 