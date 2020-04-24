import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["field"]

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
      this._autocomplete.setFields(['name'])
    }
    return this._autocomplete
  }

  preventSubmit(e) {
    if (e.key == "Enter") { e.preventDefault() }
  }
}
