###
Timeline model
###
App.Timeline = DS.Model.extend
  createdAt: DS.attr 'string'
  entries: DS.hasMany 'entry'

  formatedCreatedAt: (->
      moment(@get 'createdAt', 'MMMM-DD-YYYY').format "ddd, MMM DD"
  ).property 'createdAt'

  createdAtDate: -> moment(@get 'createdAt', 'MMMM-DD-YYYY')

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
      startAt: startAt
      endAt: endAt
      timeline: @
      project: options.project

    entry.save().then () =>
      @get('entries').pushObject entry
      @save()
