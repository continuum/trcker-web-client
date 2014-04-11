###
Start/stop button
###
'use strict'

# trcker button
App.ButtonView = Ember.View.extend
  tagName: 'button'
  classNames: ['btn trcker-btn']
  type: 'button'

# start/stop entry button
App.StartStopButtonView = App.ButtonView.extend
  classNameBindings: 'stateClass'
  started: false

  icon: (->
    if @started then 'stop' else 'play'
  ).property 'started'

  stateClass: (->
    if @started then 'started btn-danger' else 'stoped btn-default'
  ).property 'started'

  isStarted: (->
    console.log 'is started'
    @get 'started'
  ).property 'started'

  renderHtml :->
    if @get 'started'
      @$().html "<i class='fa fa-pause'></i> Pause"
    else
      @$().html "<i class='fa fa-play-circle'></i> Start"

  reRenderHtml: (->
    @renderHtml()
  ).observes 'started'

  click: ->
    console.log 'click'
    @set 'started', not @started

  didInsertElement: ->
    @_super()
    @renderHtml()
