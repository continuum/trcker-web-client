###
Application routes
###
'use strict'
App.Router.map ->
  @route 'about'
  @route 'today'
  @resource 'projects', ->
    @route 'new'
    @route 'project', path: '/:project_id'
