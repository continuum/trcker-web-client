###
Override Fixture Adapter methods
###
DS.FixtureAdapter.reopen
  queryFixtures: (fixtures, query, type) ->
    fixtures.filter (fix) ->
      truesOrFalses = []
      Object.keys(query).forEach (k) ->
        truesOrFalses.push fix[k] == query[k]
      not truesOrFalses.filter((tof) -> tof == false).length
