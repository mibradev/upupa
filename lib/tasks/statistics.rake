task :stats do
  require "rails/code_statistics"

  STATS_DIRECTORIES.concat [
    ["Policies", "app/policies"],
    ["Policy tests", "test/policies"]
  ]

  CodeStatistics::TEST_TYPES.concat [
    "Policy tests"
  ]
end
