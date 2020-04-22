import "bootstrap";

import "controllers"

import { Application } from "stimulus"

window.dispatchMapsEvent = function(...args) {
  const event = document.createEvent("Events")
  event.initEvent("google-maps-callback", true, true)
  event.args = args
  window.dispatchEvent(event)
}
