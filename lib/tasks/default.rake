Rake::Task[:default].clear

task default: ["brakeman", "standard", "standardjs", "erblint", "test:all"]
