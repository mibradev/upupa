desc "Lint with the Standard JavaScript style guide"
task :standardjs do
  system "yarn run standard", exception: true
end

desc "Lint and automatically fix with the Standard JavaScript style guide"
task "standardjs:fix" do
  system "yarn run standard --fix", exception: true
end
