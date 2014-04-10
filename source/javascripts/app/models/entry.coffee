###
Time tracker models
###
'use strict'
App.Entry = DS.Model.extend
  text: DS.attr 'string'
  createdAt: DS.attr 'date'
  startAt: DS.attr 'date'
  endAt: DS.attr 'date'
  project: DS.belongsTo 'project'
  time: (->
    moment(@get 'endAt').subtract(@get 'startAt').format('hh:mm')
  ).property 'startAt', 'endAt'

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
