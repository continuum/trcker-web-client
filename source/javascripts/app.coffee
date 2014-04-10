#= require_self
#= require_tree ./app/

'use strict'
window.App = Ember.Application.create
  LOG_TRANSITIONS: true

App.ApplicationAdapter = DS.FixtureAdapter
