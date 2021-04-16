namespace :test do
  ["policies"].each do |name|
    task name => "test:prepare" do
      $LOAD_PATH << "test"
      Rails::TestUnit::Runner.rake_run(["test/#{name}"])
    end
  end
end
