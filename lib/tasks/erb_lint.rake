desc "Lint ERB or HTML files"
task "erblint" do
  system "bundle exec erblint --lint-all"
end

desc "Correct offenses automatically in ERB or HTML files"
task "erblint:fix" do
  system "bundle exec erblint --lint-all --autocorrect"
end
