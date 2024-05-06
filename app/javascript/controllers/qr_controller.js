import { Controller } from "@hotwired/stimulus";
import QRCodeStyling from "qr-code-styling";

// Connects to data-controller="qr"
export default class extends Controller {
  static targets = [ "url" ]

  connect() {
    this.qrCode = new QRCodeStyling({
      width: 300,
      height: 300,
      type: "svg",
      data: this.urlTarget.dataset.url,
      dotsOptions: {
        color: "#4d3f31",
        type: "rounded"
      },
      backgroundOptions: {
        color: "#ffffff",
      }
    });

    this.qrCode.append(this.urlTarget);
  }

  click() {
    this.qrCode.download({ name: this.urlTarget.dataset.fileName, extension: "svg" });
  }
}
