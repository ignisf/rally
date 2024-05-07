// Entry point for the build script in your package.json
import Rails from "@rails/ujs";
Rails.start();

import * as ActiveStorage from "@rails/activestorage";
ActiveStorage.start();

import "@hotwired/turbo-rails";

import * as bootstrap from "bootstrap";

import "./controllers";
import "./channels";

