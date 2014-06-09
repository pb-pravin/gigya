require 'vcr'

class VCR::Cassette
  def sanitized_name
    name.to_s.gsub(/[^\w\-\/]+/, '_').downcase
  end
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'spec/cassettes'
  config.default_cassette_options = {
    record: :new_episodes,
    serialize_with: :json,
    preserve_exact_body_bytes: true
  }
  config.configure_rspec_metadata!
end
