desc "Lint with the Standard JavaScript style guide"
task :standardjs do
  system "yarn run standard"
end

desc "Lint and automatically fix with the Standard JavaScript style guide"
task "standardjs:fix" do
  system "yarn run standard --fix"
end
