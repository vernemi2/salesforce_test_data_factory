require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc "Run all tests."
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Dump specified sobject schema."
task :dump_schema, [:sobject, :filename] do |t, args|
  require "dotenv"
  Dotenv.load if defined?(Dotenv)
  require "salesforce_test_data_factory"
  require "json"
  client = Restforce.new
  IO.write("spec/fixtures/#{args.filename}", client.describe(args.sobject).to_json)
end
