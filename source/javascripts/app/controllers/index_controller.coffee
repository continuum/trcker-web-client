###
Application Index Controller
###
'use strict'
App.IndexController = Ember.ObjectController.extend
  actions:
    todayTimeline: (id) ->
      @transitionToRoute 'timeline', moment().format 'MMMM-DD-YYYY'
