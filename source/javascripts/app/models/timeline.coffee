###
Timeline model
###
App.Timeline = DS.Model.extend
  createdAt: DS.attr 'string'

  formatedCreatedAt: (->
      moment(@get 'createdAt', 'MMMM-DD-YYYY').format "ddd, MMM DD"
  ).property 'createdAt'

  entries: DS.hasMany 'entry', async: true

# local database
App.Timeline.FIXTURES = [
  {
    id: 1
    createdAt: 'April-10-2014'
    entries: [1,2,3]
  },
  {
    id: 2
    createdAt: 'April-11-2014'
    entries: [4]
  }
]
