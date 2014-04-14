###
Timeline routes
###
'use strict'
App.TimelineRoute = Ember.Route.extend
  model: (params) ->
    console.log "#{params.date}"
    params.date = moment().format 'MMMM-DD-YYYY' if params.date == 'today'
    # use fixture for now
    # you always can switch to @store later

    # Get the timeline is our local database
    # or create it otherwise
    tl = App.Timeline.FIXTURES.filter(
      (tl) -> tl.createdAt == params.date
    )[0]

    if tl
      @store.find 'timeline', tl.id
    else
      @store.createRecord 'timeline',
        createdAt: params.date
