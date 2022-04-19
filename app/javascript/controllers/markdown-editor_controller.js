import { Controller } from "stimulus";
import EasyMDE from "easymde";

export default class extends Controller {
  static targets = ["output"];
  connect() {
    new EasyMDE({ element: this.element });
    // console.log(EasyMDE);
  }
}
