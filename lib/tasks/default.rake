Rake::Task[:default].clear

task default: ["brakeman", "standard", "standardjs", "test:all"]
