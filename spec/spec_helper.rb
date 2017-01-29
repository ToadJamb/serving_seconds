# frozen_string_literal: true
require File.expand_path('../../lib/serving_seconds', __FILE__)

base = File.expand_path(File.dirname(__FILE__))
path = File.join(base, 'support')
Dir["#{path}/**/*.rb"].each do |file|
  require file
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.disable_monkey_patching!

  config.warnings = true

  config.order = :random
  Kernel.srand config.seed
end
