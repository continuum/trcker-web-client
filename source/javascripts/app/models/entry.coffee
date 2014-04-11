###
Time tracker models
###
'use strict'
App.Entry = DS.Model.extend
  text: DS.attr 'string'
  started: DS.attr 'boolean'
  createdAt: DS.attr 'date'
  startAt: DS.attr 'date'
  endAt: DS.attr 'date'

  project: DS.belongsTo 'project'

  time: ((key, value) ->
    if arguments.length > 1
      elapsed = moment(value, 'hh:mm') # parse time
      if elapsed.isValid()
        newEndAt = moment(@get 'startAt') # end is start
        newEndAt.add 'hours', elapsed.get 'hours'
        newEndAt.add 'minutes', elapsed.get 'minutes'
        # console.log newEndAt.toDate()
        # set new endAt
        @set 'endAt', newEndAt.toDate()
      else
        console.log "TODO: Send 'Time format invalid' message to somewhere..."
    else
      moment(@get 'endAt').subtract(@get 'startAt').format('hh:mm:ss')
  ).property 'startAt', 'endAt'

  onStartedChange: (->
    if @get 'started'
      @interval = setInterval =>
        endAt = @get 'endAt'
        @set 'endAt', moment(endAt).add 'seconds', 1
      , 1000
    else
      clearInterval @interval
  ).observes 'started'

App.Entry.FIXTURES = [
  {
    id: 1
    text: 'Initializing the codebase...'
    createdAt: new Date(Date.parse('Apr 10'))
    startAt: new Date(Date.parse('Apr 10 10:34'))
    endAt: new Date(Date.parse('Apr 10 17:34'))
    project: 1
  },
  {
    id: 2
    text: 'Studing about artificial inteligence...'
    createdAt: new Date(Date.parse('Apr 10'))
    startAt: new Date(Date.parse('Apr 10 17:40'))
    endAt: new Date(Date.parse('Apr 10 22:13'))
    project: 1
  },
  {
    id: 3
    text: 'Meeting with the client, prioritizing next features...'
    createdAt: new Date(Date.parse('Apr 11'))
    startAt: new Date(Date.parse('Apr 10 08:34'))
    endAt: new Date(Date.parse('Apr 10 12:04'))
    project: 2
  },
];
