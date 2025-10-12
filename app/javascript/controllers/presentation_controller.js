import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "filter", "card" ]

  filter() {
    this.element.querySelectorAll('.pet-supply-card').forEach((card) => {
      card.id !== this.filterName && card.classList.add('hidden')
    });
  }

  toggleVisibility() {
    const el = this.element.querySelector('.add-task-form')
    if (el.classList.contains('hidden')) {
      el.classList.remove('hidden')
    } else {
      el.classList.add('hidden')
    }
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
