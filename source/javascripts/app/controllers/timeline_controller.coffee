###
Application controller
###
'use strict'
App.TimelineController = Ember.ArrayController.extend
  now: new Date()
  formatedNow: (->
    moment(@get 'now').format "ddd, MMM Do"
  ).property 'now'
