###
Timeline Week View
###
'use strict'
App.TimelineWeekView = Ember.View.extend
  classNames: ['trcker-timeline-week']

  store: ->
    @get('controller').get 'store'

  onClick: (el, day) ->
    el.click =>
      window.location = "/#/timeline/#{day.format 'MMMM-DD-YYYY'}"
      # set active
      @$('.week-day').removeClass 'active'
      @$("#timeline-week-#{day.format('ddd').toLowerCase()}").addClass('active')

  didInsertElement: ->
    #initialize objects and events
    @_super()
    @store().find('timeline', @timelineId).then (timeline) =>
      @timeline = timeline
      tlm = moment(@timeline.get 'createdAt')
      # relatives dates to timeline createdAt
      @onClick @$('#timeline-week-mon'), moment(tlm).day 1
      @onClick @$('#timeline-week-tue'), moment(tlm).day 2
      @onClick @$('#timeline-week-wed'), moment(tlm).day 3
      @onClick @$('#timeline-week-thu'), moment(tlm).day 4
      @onClick @$('#timeline-week-fri'), moment(tlm).day 5
      @onClick @$('#timeline-week-sat'), moment(tlm).day 6
      @onClick @$('#timeline-week-sun'), moment(tlm).day 7
      #set active
      @$("#timeline-week-#{tlm.format('ddd').toLowerCase()}").addClass('active')
