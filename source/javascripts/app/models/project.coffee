###
Project model
###
'use strict'
App.Project = DS.Model.extend
  name: DS.attr 'string'
  desc: DS.attr 'string'
  entries: DS.hasMany 'entry'
