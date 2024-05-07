import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="qr-scan-button"
export default class extends Controller {
    connect() {}

    click() {
        this.dispatch("scan");
    }
}
