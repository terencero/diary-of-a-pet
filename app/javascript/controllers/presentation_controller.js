import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "filter", "card" ]

  filter() {
    console.log(`what is this ${this.data.get('filterValue')}`)
    this.element.querySelectorAll('.pet-supply-card').forEach((card) => {
      card.id !== this.filterName && card.classList.add('hidden')
    });
  }

  toggleVisibility() {
    const el = this.element.querySelector('.add-supply-form')
    if (el.classList.contains('hidden')) {
      el.classList.remove('hidden')
    } else {
      el.classList.add('hidden')
    }
  }

  clearFilter() {
    this.card.classList.remove('hidden')
  }
  
  clearAllFilters() {
    this.element.querySelectorAll('.pet-supply-card').forEach((card) => card.classList.remove('hidden'))
  }

  get filterName() {
    return this.filterTarget.value
  }
}
