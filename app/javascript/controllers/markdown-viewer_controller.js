import { Controller } from "stimulus";
import { marked } from "marked";

export default class extends Controller {
  static targets = ["output"];
  initialize() {
    this.origContent = null;
  }

  connect() {
    this.origContent = this.element.textContent;
    this.element.innerHTML = marked.parse(this.origContent);
  }

  disconnect() {
    this.element.textContent = this.origContent;
  }
}
