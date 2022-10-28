import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="movie-button"
export default class extends Controller {
  connect() {
  }

  select() {
    let form = document.getElementById('bookmark_movie_id');
    form.value = this.element.dataset.movie;

    document.body.scrollIntoView({
      behavior: "smooth"
    });
  }
}
