import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"

// Connects to data-controller="form"
export default class extends Controller {
  clear(event) {

    // setTimeout(async () => {
    //   const request = new FetchRequest('GET', '/clear_message', { responseKind: 'turbo_stream' })
    //   await request.perform()
    // }, 5000)

    event.target.requestSubmit();
  }
}
