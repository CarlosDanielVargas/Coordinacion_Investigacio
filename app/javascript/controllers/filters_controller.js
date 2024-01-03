import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filters"
export default class extends Controller {
  connect() {
    this.showFiltersButton();
    this.fixedFiltersContent();
  }

  toggle(e) {
    const toggle = e.currentTarget.querySelector('#toggle');
    const filtersContent = e.currentTarget.parentElement.querySelector('div[class$="__filters-body"]');

    if (toggle.innerHTML == '<i class="bi bi-caret-down-fill"></i>') {
      toggle.innerHTML = '<i class="bi bi-caret-up-fill"></i>';
      filtersContent.style.display = 'block';
      sessionStorage.setItem(`filterState-${toggle.dataset.name}`, 'opened');
      return;
    }
    toggle.innerHTML = '<i class="bi bi-caret-down-fill"></i>';
    filtersContent.style.display = 'none';
    sessionStorage.setItem(`filterState-${toggle.dataset.name}`, 'closed');
  }

  showFiltersButton() {
    const filtersButton = document.querySelector('#clear-filters-button');
    const currentURL = window.location.href;
    const query = currentURL.indexOf('q%');
    if (query != -1) filtersButton.style.display = 'block';
  }
  
  clearFilters() {
    const currentURL = window.location.href;
    const index = currentURL.indexOf('?');

    if (index !== -1) {
      const newURL = currentURL.substring(0, index);
      window.location.href = newURL;
    }
  }

  fixedFiltersContent() {
    const toggle = document.querySelector('#toggle');

    const filtersContentState = sessionStorage.getItem(`filterState-${toggle.dataset.name}`);
    const filtersContent = document.querySelector('div[class$="__filters-body"]');

    if (filtersContentState === `opened`) {
      toggle.innerHTML = '<i class="bi bi-caret-up-fill"></i>';
      filtersContent.style.display = 'block';
    }
  }
}
