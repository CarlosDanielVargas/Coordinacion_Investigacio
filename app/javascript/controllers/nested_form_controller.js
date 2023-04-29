import {Controller} from "@hotwired/stimulus"

export default class extends Controller {

    add_association(event) {
        event.preventDefault();
        const level = event.target.dataset.level;
        const template = document.getElementById(`template${level}`);
        let container;
        if (level === "1") {
            container = event.target.parentElement;
        } else {
            container = event.target.closest(".nested-fields").parentElement;
        }
        let childrenDiv = container.querySelector(".childrenContainer");
        const totalChildren = childrenDiv.childElementCount + 1;
        this.createChildren(childrenDiv, level, totalChildren, template);
    }

    remove_association(event) {
        event.preventDefault();
        let item = event.target.closest(".nested-fields");
        item.querySelector("input[name*='_destroy']").value = 1;
        item.style.display = 'none';
        let childrenDiv = item.parentElement.parentElement.querySelector(".childrenContainer");
        if (childrenDiv) {
            let children = childrenDiv.children;
            for (let i = 0; i < children.length; i++) {
                children[i].style.display = 'none';
                children[i].querySelector("input[name*='_destroy']").value = 1;
            }
        }
    }

    create_id(childrenDiv, level, totalChildren) {
        if (level > 1) {
            let parentDiv = childrenDiv.parentElement.parentElement.parentElement;
            console.log(parentDiv);
            let parentId = parentDiv.id;
            let children = parentDiv.childElementCount + 1;
            return parentId + "-" + children;
        } else {
            return level + "-" + totalChildren;
        }
    }

    createChildren(childrenDiv, level, totalChildren, template) {
        let newChild = document.createElement('div');
        newChild.classList.add('row');
        newChild.classList.add(`ms-${level}`);
        newChild.classList.add('mt-1');
        newChild.classList.add('mb-1');
        newChild.id = this.create_id(childrenDiv, level, totalChildren);
        console.log(newChild.id);
        this.changeTemplateText(newChild, level, template);
        childrenDiv.appendChild(newChild);
        return newChild;
    }

    changeTemplateText(newChild, level, template) {
        switch (level) {
            case "1":
                newChild.innerHTML = template.innerHTML.replace(/TEMPLATE_ARTICLE/g, Math.floor(Math.random() * 1000));
                break;
            case "2":
                newChild.innerHTML = template.innerHTML.replace(/TEMPLATE_AGREEMENT/g, Math.floor(Math.random() * 1000));
                break;
            case "3":
                newChild.innerHTML = template.innerHTML.replace(/TEMPLATE_TRANSACTION/g, Math.floor(Math.random() * 1000));
                break;
            case "4":
                newChild.innerHTML = template.innerHTML.replace(/TEMPLATE_SUBSECTION/g, Math.floor(Math.random() * 1000));
                break;
            default:
                break;
        }
    }
}