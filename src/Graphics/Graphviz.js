"use strict";

exports.viz_internal = function(data, format, engine, scale) {
  var v = undefined;
  if (typeof window === "undefined") {
    v = require('viz.js');
  } else {
    v = Viz;
  }
  return v(data, {format: format, engine: engine, scale: scale})
}