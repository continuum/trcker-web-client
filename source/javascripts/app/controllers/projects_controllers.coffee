###
Project related controllers
###
'use strict'
App.ProjectsController = Ember.ArrayController.extend
  actions:
    visitProject: (project) ->
      @transitionToRoute 'projects.project', project

    create: ->
      project = @store.createRecord 'project',
        name: @get 'name'
        desc: @get 'desc'

      project.save()
      @transitionToRoute 'projects'

App.ProjectsNewController = App.ProjectsController.extend()

App.ProjectsProjectController = Ember.ObjectController.extend
  actions:
    delete: (id) ->
      if confirm 'Are you sure?'
        project = @store.find('project', id).then (project) =>
          project.destroyRecord()
          @transitionToRoute 'projects'
