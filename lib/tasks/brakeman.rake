desc "Check for security vulnerabilities"
task :brakeman do
  system "bundle exec brakeman --run-all-checks --no-pager"
end
