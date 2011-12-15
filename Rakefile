require 'rubygems'
require 'rake/clean'

# Clean up bundling (in case of 'rake clean')
CLEAN.include('.vendor')
CLEAN.include('.bundle')

# Bundler
bundle_bin = Gem.bin_path("bundler", "bundle")
bundle_bucket = '.vendor/bundle' # where bundler installs gems

desc "Create/Update the bundler Gemfile.lock if Gemfile is updated"
file "Gemfile.lock" => "Gemfile" do
  Rake::Task[:bundle].invoke
end

desc "Bundle dependent gems into the vendor directory"
task :bundle => [ "Gemfile.lock" ] do
  sh("#{bundle_bin} install --path #{bundle_bucket}")
end

desc "Run the test"
task :test => [ :bundle ] do
  sh("bin/test")
end
