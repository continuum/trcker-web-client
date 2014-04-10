###
Project model
###
'use strict'
App.Project = DS.Model.extend
  name: DS.attr 'string'
  desc: DS.attr 'string'
  entries: DS.hasMany 'entry'

App.Project.FIXTURES = [
  {
    id: 1
    name: 'Sounds Good'
    desc: 'Video\'s sounds editor on your browser...'
  },
  {
    id: 2
    name: 'GetOnBoard'
    desc: 'A job board for webpros by webpros...'
  },
  {
    id: 3
    name: 'BeautifulLogs'
    desc: 'App logs are not awful anymore...'
  }
];
