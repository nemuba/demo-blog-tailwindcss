import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="tag-list"
// create tag list
export default class extends Controller {
  static targets = ["tagList", "tagInput"]
  static values = { list: [] }
  // create tag list

  change(event) {
    event.preventDefault();

    this.addTag()
  }

  addTag() {
    const tags = this.tagInputTarget.value.split(',')

    tags.forEach(tag => {
      if (tag.length > 0) {
        if (!this.listValue.map(item => item.toUpperCase()).includes(tag.trim().toUpperCase())) {
          this.listValue = [...this.listValue, tag]
          this.tagListTarget.append(this.createTag(tag));
          this.addTagToForm(tag, 'name')
        }
      }
    });

    this.tagInputTarget.value = "";
  }

  addTagToForm(tag, name) {
    console.log(this.listValue.indexOf(tag))
    const indexTag = this.listValue.indexOf(tag)
    let index = indexTag == -1 ? 0 : indexTag
    const Input = document.createElement('input')
    Input.setAttribute('type', 'hidden')
    Input.setAttribute('name', `post[tags_attributes][${index}][${name}]`)
    Input.setAttribute('value', tag)
    this.tagListTarget.appendChild(Input)
  }

  createTag(tag) {
    const div = document.createElement('div')
    div.classList.add('flex', 'items-center', 'justify-between', 'my-1', 'flex-wrap')
    const span = document.createElement('span')
    span.classList.add('font-bold', 'p-1', 'text-white', 'bg-blue-500', 'rounded', 'mx-1')
    span.innerHTML = tag

    div.appendChild(span)
    const removeButton = document.createElement('button')
    removeButton.innerHTML = 'X'
    removeButton.classList.add('btn-secondary', 'p-2', 'rounded-full', 'bg-gray-500', 'text-sm')
    removeButton.setAttribute('data-action', 'click->tag-list#removeTag')
    removeButton.setAttribute('type', 'button')

    div.appendChild(removeButton)

    return div
  }

  removeTag(event) {
    event.preventDefault()
    const tag = event.target.parentElement.children[0].innerText
    event.target.parentElement.remove()

    this.listValue = this.listValue.filter(tagName => tagName != tag)
    const input = this.tagListTarget.querySelector(`input[value="${tag}"]`)

    if (input) {
      input.remove()
    }

  }
}
