import { Controller } from "@hotwired/stimulus";
import confetti from "canvas-confetti";

// Connects to data-controller="confetti"
export default class extends Controller {
    connect() {
        this.currentValue = this.element.innerText;
    }

    async change() {
        if (this.currentValue != this.element.innerText) {
            await confetti();
            this.currentValue = this.element.innerText;
        }
    }
}
