import { Controller } from "@hotwired/stimulus";
import {Html5QrcodeScanner, Html5QrcodeScanType, Html5QrcodeSupportedFormats} from "html5-qrcode";
import * as bootstrap from "bootstrap";

// Connects to data-controller="qr_reader"
export default class extends Controller {
    static targets = [ "body" ]

    connect() {
        let config = {
            fps: 10,
            qrbox: {width: 250, height: 250},
            rememberLastUsedCamera: true,
            // Only support camera scan type.
            supportedScanTypes: [Html5QrcodeScanType.SCAN_TYPE_CAMERA],
            videoConstraints: { facingMode: "environment", focusMode: "continuous"},
            formatsToSupport: [Html5QrcodeSupportedFormats.QR_CODE]
        };

        this.modal = new bootstrap.Modal(this.element, {
            keyboard: false
        });

        this.scanner = new Html5QrcodeScanner(
            this.bodyTarget.id,
            config,
            /* verbose= */ false);
    }

    start() {
        this.modal.show();
        this.scanner.render(this.onScanSuccess);
    }

    dismiss(){
        this.scanner.clear();
        this.modal.hide();
    }

    onScanSuccess(decodedText, decodedResult) {
        if (decodedText.startsWith("https://" + window.location.hostname + "/")) {
            window.location.href = decodedText;
        }
    }
}
