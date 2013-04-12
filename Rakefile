require 'rake'
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

task :default => [:test_everything]

task :test_everything do   
   	Rake::Task['rspec'].invoke
   	Rake::Task['integration'].invoke
    Rake::Task['cucumber_tests'].invoke 
   	Rake::Task['robot_tests'].invoke
   	Rake::Task['check_external_links'].invoke
end

desc "Run the spec tasks"
RSpec::Core::RakeTask.new(:rspec) do |t|
  t.rspec_opts = ["--tag ~integration"]
end

desc "Run the integration spec tasks"
RSpec::Core::RakeTask.new(:integration) do |t|
  t.rspec_opts = ["--tag integration"]
end

task :robot_tests do
	sh "pybot -d robottests/output --noncritical 'developing' robottests"
end

desc "run cucumber features"
Cucumber::Rake::Task.new(:cucumber_tests) do |t|
  	t.cucumber_opts = "features --format pretty"
end

desc "Link checking on ScrumPrimer.org"
task :check_external_links do
  require 'link_checker'
  LinkChecker.new(:target => 'http://127.0.0.1:9292').check_uris
end

