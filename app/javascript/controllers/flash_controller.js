import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["output"];
  close(e) {
    e.preventDefault();
    this.element.remove();
    // console.log("close");
  }
}
