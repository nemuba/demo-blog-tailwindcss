import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from "@rails/request.js"
// Connects to data-controller="confirm"
export default class extends Controller {
  static values = { 'message': String }

  destroy(event) {
    if (!window.confirm(this.messageValue)) {
      event.preventDefault()
    }

    // setTimeout(async () => {
    //   const request = new FetchRequest('GET', '/clear_message', { responseKind: 'turbo_stream' })
    //   await request.perform()
    // }, 5000)
  }
}
