###
Timeline routes
###
'use strict'
App.TimelineRoute = Ember.Route.extend
  model: (params) ->
    console.log "#{params.date}"
    params.date = moment().format 'MMMM-DD-YYYY' if params.date == 'today'
    # Get the timeline from storage
    # or create a new one otherwise
    @store.findAll('timeline').then (tls) =>
      tl = tls.filter (t) -> t.get('createdAt') == params.date
      if tl.length
        tl[0]
      else
        timeline = @store.createRecord 'timeline',
          createdAt: params.date
        timeline.save()
