import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    const activeLink = document.getElementById(`${navbarActiveLink}-navlink`)
    activeLink.classList.add('active')
  }
}
