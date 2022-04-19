import { Controller } from "stimulus";
import EasyMDE from "easymde";
import "easymde/dist/easymde.min.css";

export default class extends Controller {
  static targets = ["output"];
  initialize() {
    this.editor = null;
  }

  connect() {
    this.editor = new EasyMDE({
      element: this.element,
      spellChecker: false,
    });
    // console.log(EasyMDE);
  }

  disconnect() {
    this.editor.toTextArea();
    this.editor.cleanup();
    this.editor = null;
  }
}
