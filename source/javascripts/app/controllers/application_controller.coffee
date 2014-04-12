###
Application controller
###
'use strict'
App.TodayController = Ember.ArrayController.extend
  now: new Date()
  formatedNow: (->
    moment(@get 'now').format "ddd, MMM Do"
  ).property 'now'

  actions:
    play: (entryId) -> alert "Not implemented"
    stop: (entryId) -> alert "Not implemented"
    edit: (entryId) -> alert "Not implemented"
    newEntry: -> alert 'Not implemented'
