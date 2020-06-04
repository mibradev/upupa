# frozen_string_literal: true

task :stats do
  require "rails/code_statistics"

  STATS_DIRECTORIES += [
    ["Policies", "app/policies"],
    ["Policy tests", "test/policies"]
  ]

  CodeStatistics::TEST_TYPES += [
    "Policy tests"
  ]
end
