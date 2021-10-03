desc "Clear app/assets/builds/"
task "assets:builds:clear" do
  rm_rf Dir["app/assets/builds/[^.]*"], verbose: false
end
