###
Application routes
###
'use strict'
App.TodayRoute = Ember.Route.extend
  # hook to get all the entries
  model: ->
    console.log "Load all the entries for today"
    @store.findAll "entry"
