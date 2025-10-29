import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "filter", "card", "visibility" ]

  filter() {
    this.element.querySelectorAll('.pet-supply-card').forEach((card) => {
      card.id !== this.filterName && card.classList.add('hidden')
    });
  }

  filterByPet() {
    console.log("filter by pet controller func")
  }

  toggleVisibility() {
    this.visibilityTarget.classList.toggle('hidden')
  }

  clearFilter() {
    // TODO: not being used rn
    this.card.classList.remove('hidden')
  }
  
  clearAllFilters() {
    this.element.querySelectorAll('.pet-supply-card').forEach((card) => card.classList.remove('hidden'))
  }

  get filterName() {
    return this.filterTarget.value
  }
}
