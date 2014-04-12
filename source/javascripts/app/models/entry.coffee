###
Time tracker models
###
'use strict'
App.Entry = DS.Model.extend
  text: DS.attr 'string'
  started: DS.attr 'boolean'
  createdAt: DS.attr 'string'
  startAt: DS.attr 'date'
  endAt: DS.attr 'date'

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

    moment(@get 'endAt').subtract(@get 'startAt').format('hh:mm:ss')
  ).property 'startAt', 'endAt'

  onStartedChange: (->
    if @get 'started'
      @interval = setInterval =>
        @set 'endAt', moment(@get 'endAt').add 'seconds', 1
      , 1000
    else
      clearInterval @interval
  ).observes 'started'

# local database
App.Entry.FIXTURES = [
  {
    id: 1
    text: 'Initializing the codebase...'
    createdAt: 'April-10-2014'
    startAt: new Date(Date.parse('Apr 10 2014 10:34'))
    endAt: new Date(Date.parse('Apr 10 2014 17:34'))
    project: 1
  },
  {
    id: 2
    text: 'Studing about artificial inteligence...'
    createdAt: 'April-10-2014'
    startAt: new Date(Date.parse('Apr 10 2014 17:40'))
    endAt: new Date(Date.parse('Apr 10 2014 22:13'))
    project: 1
  },
  {
    id: 3
    text: 'Meeting with the client, prioritizing next features...'
    createdAt: 'April-10-2014'
    startAt: new Date(Date.parse('Apr 10 2014 08:34'))
    endAt: new Date(Date.parse('Apr 10 2014 12:04'))
    project: 2
  },
  {
    id: 4
    text: 'Meeting with the client, prioritizing next features...'
    createdAt: 'April-11-2014'
    startAt: new Date(Date.parse('Apr 11 2014 09:04'))
    endAt: new Date(Date.parse('Apr 11 2014 17:04'))
    project: 3
  }
];
