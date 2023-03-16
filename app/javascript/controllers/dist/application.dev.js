"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.application = void 0;

var _stimulus = require("@hotwired/stimulus");

var application = _stimulus.Application.start(); // Configure Stimulus development experience


exports.application = application;
application.debug = false;
window.Stimulus = application;