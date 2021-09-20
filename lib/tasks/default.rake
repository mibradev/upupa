Rake::Task[:default].clear

task default: ["standard", "standardjs", "test:all"]
