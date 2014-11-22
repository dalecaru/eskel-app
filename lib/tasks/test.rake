require 'rake/testtask'

namespace :test do |ns|
  test_files             = FileList['spec/**/*_spec.rb']
  acceptance_test_files  = FileList['spec/acceptance/**/*_spec.rb']
  unit_test_files        = test_files - acceptance_test_files

  desc 'run unit tests'
  Rake::TestTask.new('unit') do |t|
    t.libs.push "lib"
    t.test_files = unit_test_files
    t.verbose = true
  end

  desc 'run acceptance tests'
  Rake::TestTask.new('acceptance') do |t|
    t.libs.push "lib"
    t.test_files = acceptance_test_files
    t.verbose = true
  end
end

desc 'run all tests'
task :test => %w[test:unit test:acceptance]