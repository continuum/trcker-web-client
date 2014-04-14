###
Override Fixture Adapter methods
'use strict'
DS.FixtureAdapter.reopen
  queryFixtures: (fixtures, query, type) ->
    fixtures.filter (fix) ->
      truesOrFalses = []
      Object.keys(query).forEach (k) ->
        truesOrFalses.push fix[k] == query[k]
      not truesOrFalses.filter((tof) -> tof == false).length

  findOne: (store, type, query) ->
    fixtures = this.fixturesForType type
    @queryFixtures(fixtures, query, type).objectAt 0
###
