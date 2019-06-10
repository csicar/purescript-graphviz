"use strict";

exports.viz_internal = function(data, format, engine, scale) {
  var v = undefined;
  try {
    v = require('viz.js');
  }
  catch(error) {
    v = Viz;
  }
  return v(data, {format: format, engine: engine, scale: scale})
}
