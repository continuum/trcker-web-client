###
Timeline New Entry View
###
'use strict'
App.TimelineNewEntryView = Ember.View.extend
  classNames: ['trcker-timeline-new-entry']
  timelineId: null

  substringMatcher: (projects) ->
    (q, cb) ->
      matches = [];
      substrRegex = new RegExp(q, 'i');
      projects.forEach (prj) ->
        if substrRegex.test prj.get 'name'
          matches.push
            value: prj.get 'id'
            name: prj.get 'name'

      cb matches

  store: ->
    @get('controller').get 'store'

  createEntry: (project, text, elapsedTime) ->
    @store().find('timeline', @timelineId).then (timeline) ->
      console.log timeline
      timeline.addEntry
        project: project
        text: text
        elapsedTime: elapsedTime

  didInsertElement: ->
    #initialize objects and events
    @_super()
    @store().findAll('project').then (projects) =>

      @projectName = @$('#new-entry-project-name')
      @text = @$('#new-entry-text')
      @time = @$('#new-entry-time')

      # project name
      @projectName.typeahead {minLength: 1, highlight: true},
        name: 'projects'
        displayKey: 'name'
        source: @substringMatcher projects

      @projectName.on 'typeahead:selected', (event, item) =>
        @project = item
      @projectName.on 'typeahead:opened', (event) => @project = undefined


      @$('#new-entry-btn').click =>
        # create new entry for timeline
        t = @time.val() or '00:00'
        if @project and @project.value
          @store().find('project', @project.value).then (prj) =>
            if prj
              if moment(t, 'HH:mm').isValid()
                @createEntry prj, @text.val(), t
              else
                alert "Invalid time format, example: '2:34' "
            else
              alert "Project '#{@project.name}' not found for id: #{@project.value}"
        else
          alert "Project not found"
