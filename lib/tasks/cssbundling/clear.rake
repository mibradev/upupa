namespace :css do
  desc "Clear CSS builds"
  task "clear" do
    rm_rf Dir["app/assets/builds/[^.]*.css"], verbose: false
  end
end

Rake::Task["assets:clean"].enhance ["css:clear"]
