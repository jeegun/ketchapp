import "bootstrap";

import "controllers"

window.initMap = function (...args) {
  const event = document.createEvent("Events")
  event.initEvent("google-search-callback", true, true)
  event.args = args
  window.dispatchEvent(event)
}
