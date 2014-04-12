###
Timeline routes
###
'use strict'
App.TimelineRoute = Ember.Route.extend
  # hook to get all the entries
  model: (params) ->
    console.log "#{params.date}"
    @store.find("timeline", createdAt : params.date).then (timeline) ->
      timeline.objectAt 0
