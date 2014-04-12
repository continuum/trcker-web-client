###
Start/stop button
###
'use strict'

# trcker button
App.ButtonView = Ember.View.extend
  tagName: 'button'
  classNames: ['btn trcker-btn']
  # type: 'button'

# start/stop entry button
App.StartStopButtonView = App.ButtonView.extend
  classNameBindings: 'stateClass'
  started: false
  entryId: null

  stateClass: (->
    if @started then 'started btn-danger' else 'stoped btn-default'
  ).property 'started'

  renderHtml :->
    if @get 'started'
      @$().html "<i class='fa fa-pause'></i> Pause"
    else
      @$().html "<i class='fa fa-play-circle'></i> Start"

  onStateChange: (->
    # refresh content
    @renderHtml()
    # send signal to model
  ).observes 'started'

  store: ->
    @get('controller').get 'store'

  entry: (id, cb) ->
    @store().find('entry', @entryId).then (entry) -> cb entry

  click: ->
    @set 'started', not @started
    @entry @entryId, (entry) =>
      entry.set 'started', @started

  didInsertElement: ->
    @_super()
    @renderHtml()
