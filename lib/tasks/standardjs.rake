desc "Lint with the Standard JavaScript style guide"
task :standardjs do
  system "bin/yarn standard", exception: true
end

desc "Lint and automatically fix with the Standard JavaScript style guide"
task "standardjs:fix" do
  system "bin/yarn standard --fix", exception: true
end
