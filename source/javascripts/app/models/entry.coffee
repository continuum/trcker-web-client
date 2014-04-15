###
Timeline Entry model
###
'use strict'
App.Entry = DS.Model.extend
  text: DS.attr 'string'
  started: DS.attr 'boolean', defaultValue: false
  startAt: DS.attr 'date'
  endAt: DS.attr 'date'

  timeline: DS.belongsTo 'timeline'
  project: DS.belongsTo 'project'

  elapsedTime: ((key, value) ->
    if arguments.length > 1
      elapsed = moment(value, 'hh:mm') # parse time
      if elapsed.isValid()
        newEndAt = moment(@get 'startAt') # end is start
        newEndAt.add 'hours', elapsed.get 'hours'
        newEndAt.add 'minutes', elapsed.get 'minutes'
        console.log "New Date is: #{newEndAt.toDate()}"
        # set new endAt
        @set 'endAt', newEndAt.toDate()
      else
        console.log "TODO: Send 'Time format invalid' message to somewhere..."
        alert 'Bad formated time. A good example is 5:34'

    moment(@get 'endAt').subtract(@get 'startAt').format('HH:mm:ss')
  ).property 'startAt', 'endAt'

  onStartedChange: (->
    if @get 'started'
      @interval = setInterval =>
        @set 'endAt', moment(@get 'endAt').add 'seconds', 1
      , 1000
    else
      clearInterval @interval
  ).observes 'started'
