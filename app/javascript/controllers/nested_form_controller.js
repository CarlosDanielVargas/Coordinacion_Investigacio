import {
    add,
    Controller
} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["add_item"];

    items_added = 0;

    add_association(event) {
        this.items_added += 1;
        const level = event.target.dataset.level;
        const template = document.getElementById(`template${level}`);
        const add_item = document.getElementById(`addItem${level}`);
        console.log(template);
        console.log(add_item);
        console.log(this.items_added)
        event.preventDefault();
        let content = '<div>';
        content += template.innerHTML.replace(/TEMPLATE_RECORD/g, this.items_added.toString());
        content += '</div>';
        add_item.insertAdjacentHTML('afterend', content);
    }

    remove_association(event) {
        event.preventDefault();
        let item = event.target.closest(".nested-fields");
        item.querySelector("input[name*='_destroy']").value = 1;
        item.style.display = 'none';
    }

}