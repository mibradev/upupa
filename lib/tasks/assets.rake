desc "Build CSS and JavaScript bundles"
task "assets:build": ["css:build", "javascript:build"]

desc "Clear app/assets/builds/"
task "assets:builds:clear" do
  rm_rf Dir["app/assets/builds/[^.]*"], verbose: false
end
