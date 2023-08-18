import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    filterOptions() {
        var searchQuery = this.element.value.toLowerCase();
        var options = this.element.options;
        for (var i = 0; i < options.length; i++) {
            var optionValue = options[i].text.toLowerCase();
            if (optionValue.includes(searchQuery)) {
                options[i].style.display = '';
            } else {
                options[i].style.display = 'none';
            }
        }
    }
}