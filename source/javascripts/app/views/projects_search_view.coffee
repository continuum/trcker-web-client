###
Custom search view with autocomplete support
###
'use strict'
App.ProjectsSearchView = Ember.TextField.extend
  classNames: ['typeahead form-control']

  placeholder: 'Search for projects'

  substringMatcher: (projects) ->
    (q, cb) ->
      matches = [];
      substrRegex = new RegExp(q, 'i');

      $.each projects, (i, prj) ->
        if substrRegex.test prj.name
          matches.push
            value: prj.id
            name: prj.name

      cb matches

  didInsertElement: ->
    @_super()
    @typeahead = @$().typeahead {minLength: 2, highlight: true},
      name: 'projects'
      displayKey: 'name'
      source: @substringMatcher App.Project.FIXTURES

    @typeahead.on 'typeahead:selected', (event, item) =>
      # ugly patch: A more elegant solution is to call
      # a method on the Projects controller
      # (but ain't supported yet by ember)
      # TODO: @get('controller').send 'visitProject', item
      window.location = "/#/projects/#{item.value}"
