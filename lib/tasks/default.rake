Rake::Task[:default].clear

task default: ["brakeman", "standard", "erblint", "test:all"]
