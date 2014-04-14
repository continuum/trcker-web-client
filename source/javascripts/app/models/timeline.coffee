###
Timeline model
###
App.Timeline = DS.Model.extend
  createdAt: DS.attr 'string'

  formatedCreatedAt: (->
      moment(@get 'createdAt', 'MMMM-DD-YYYY').format "ddd, MMM DD"
  ).property 'createdAt'

  createdAtDate: -> moment(@get 'createdAt', 'MMMM-DD-YYYY')

  entries: DS.hasMany 'entry', async: true

  addEntry: (options) ->
    # calculate startAt
    now = moment()
    startAt = @createdAtDate().add 'hours', now.get 'hours'
    startAt.add 'minutes', now.get 'minutes'
    startAt.add 'seconds', now.get 'seconds'
    # add elapsed
    elapsed = moment(options.elapsedTime, 'HH:mm')
    endAt = moment(startAt)
    endAt.add 'hours', elapsed.get 'hours'
    endAt.add 'minutes', elapsed.get 'minutes'

    entry = @store.createRecord 'entry',
      text: options.text
      started: false
      startAt: startAt
      endAt: endAt
      timeline: @
      project: options.project

    # entries load async, so @get return a promise
    @get('entries').then (entries) -> entries.pushObject entry

# local database
App.Timeline.FIXTURES = [
  {
    id: 1
    createdAt: 'April-14-2014'
    entries: [1,2,3]
  },
  {
    id: 2
    createdAt: 'April-15-2014'
    entries: [4]
  }
]
