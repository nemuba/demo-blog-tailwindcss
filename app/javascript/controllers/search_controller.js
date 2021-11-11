import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js";
// Connects to data-controller="search"
export default class extends Controller {
  perform(event) {
    event.target.reset()

    // this.clear_message()
  }

  clear_message() {
    setTimeout(async () => {
      const request = new FetchRequest('GET', '/clear_message', { responseKind: 'turbo_stream' })
      await request.perform()
    }, 5000)
  }
}
