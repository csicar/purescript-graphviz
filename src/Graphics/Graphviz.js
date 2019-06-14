"use strict";
const Viz = require('viz.js');
const viz_full = require('viz.js/full.render.js');

exports._viz_internal = function(engine) {
  const viz = new Viz({ Module: viz_full.Module, render: viz_full.render });
  return function(format) {
    return function(string) {
      return function(onError, onSuccess) {
        viz.renderString(string, { engine: engine, format: format})
          .then(onSuccess)
          .catch(onError)
      }
    }
  }
}