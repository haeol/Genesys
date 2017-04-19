require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Genesys
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    require 'oembed'
    # Register all providers
    OEmbed::Providers.register_all
    OEmbed::Providers.register_fallback(
      OEmbed::ProviderDiscovery,
      OEmbed::Providers::Noembed
    )

    config.autoload_paths << Rails.root.join("lib")
  end
end
