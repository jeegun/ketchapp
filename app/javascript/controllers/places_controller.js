// tutorial: https://www.driftingruby.com/episodes/google-maps-api-with-stimulusjs

import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["field", "latitude", "longitude"]

  connect() {
    if (typeof (google) != "undefined"){
      this.initializeMap()
    }
  }

  initializeMap() {
    this.autocomplete()
    console.log('init')
  }

  autocomplete() {
    if (this._autocomplete == undefined) {
      this._autocomplete = new google.maps.places.Autocomplete(this.fieldTarget)
      this._autocomplete.setFields(['geometry', 'name'])
      this._autocomplete.addListener('place_changed', this.locationChanged.bind(this))
    }
    return this._autocomplete
  }

  locationChanged() {
    let place = this.autocomplete().getPlace()

    if (!place.geometry) {
      // User entered the name of a Place that was not suggested and
      // pressed the Enter key, or the Place Details request failed.
      window.alert("No details available for input: '" + place.name + "'");
      return;
    }

    this.latitudeTarget.value = place.geometry.location.lat()
    this.longitudeTarget.value = place.geometry.location.lng()
  }

  preventSubmit(e) {
    if (e.key == "Enter") { e.preventDefault() }
  }
}
