require 'rake'
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'link_checker'

task :default => [:test_everything]

task :test_everything do
   	Rake::Task['rspec'].invoke

   	Rake::Task['run_rackup_daemon'].invoke

   	begin
   	  Rake::Task['jasmine:ci'].invoke
   	  Rake::Task['integration'].invoke
      Rake::Task['cucumber_tests'].invoke
   	  Rake::Task['robot_tests'].invoke
   	  Rake::Task['check_external_links'].invoke
   	ensure
   	  Rake::Task['stop_rackup_daemon'].invoke
 	  end
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

desc "Startup rackup as a daemon and store the pid"
task :run_rackup_daemon do
  sh "rackup -D -P rackup.pid"
end

desc "Kill rackup based on the pid"
task :stop_rackup_daemon do
  sh "kill -9 `cat rackup.pid`"
  sh "rm -f rackup.pid"
end


begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

# Deprecated. Needs to be replaced with another linter
#Jshintrb::JshintTask.new :jshint do |t|
  #t.pattern = 'public/js/**/scrumprimer.js'
  #t.options = :defaults
#end

