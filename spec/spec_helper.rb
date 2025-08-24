require 'rspec'
require 'jekyll'
require 'jekyll/test_plugin'
require 'html-proofer'
require 'rspec-html_matchers'

# Configure RSpec
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed

  # Jekyll test configuration
  config.before(:suite) do
    # Build the site for testing
    Jekyll::Commands::Build.process({
      "source" => File.expand_path("../", __FILE__),
      "destination" => File.expand_path("../_site", __FILE__),
      "disable_disk_cache" => true
    })
  end

  config.after(:suite) do
    # Clean up test build
    FileUtils.rm_rf(File.expand_path("../_site", __FILE__))
  end
end

# Helper methods for testing
def site
  @site ||= Jekyll::Site.new(Jekyll.configuration({
    "source" => File.expand_path("../", __FILE__),
    "destination" => File.expand_path("../_site", __FILE__),
    "disable_disk_cache" => true
  }))
end

def posts
  @posts ||= site.posts.docs
end

def pages
  @pages ||= site.pages
end

def layouts
  @layouts ||= site.layouts
end

def includes
  @includes ||= site.includes
end
