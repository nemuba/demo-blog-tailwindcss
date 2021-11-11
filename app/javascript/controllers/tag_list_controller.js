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

  remove(event) {
    event.preventDefault();

    const classes = Array.from(event.target.parentElement.classList)

    if (classes.includes('bg-green-500')) {
      event.target.parentElement.classList.remove('bg-green-500')
      event.target.parentElement.classList.add('bg-red-500')
    } else {
      event.target.parentElement.classList.remove('bg-red-500')
      event.target.parentElement.classList.add('bg-green-500')
    }
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
    div.classList.add('flex', 'items-center', 'my-1', 'flex-wrap', 'mx-1', 'rounded-md')
    const span = document.createElement('span')
    span.classList.add('p-2', 'text-white', 'bg-blue-500', 'h-10', 'rounded-l', 'font-bold')
    span.innerHTML = tag

    div.appendChild(span)
    const removeButton = document.createElement('button')
    removeButton.innerHTML = 'X'
    removeButton.classList.add('btn-secondary', 'bg-blue-400', 'text-sm', 'p-2', 'h-10', 'rounded-r-1', 'rounded-l-none', 'font-bold')
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
