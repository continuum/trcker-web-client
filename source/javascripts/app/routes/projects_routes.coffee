###
Projects routes
###
'use strict'
App.ProjectsIndexRoute = Ember.Route.extend
  # hook to get all the projects
  model: ->
    console.log "Load all the projects"
    @store.findAll "project"

App.ProjectsNewRoute = Ember.Route.extend
  setupController: (controller) ->
    console.log 'Initializing fields'
    controller.set 'name', null
    controller.set 'desc', null
