Rake::Task[:default].clear

task default: ["standard", "standardjs", "webpacker:compile", "test:all"]
