require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MumblingMoomin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    if Rails.env.production?
      config.force_ssl = true
    end
    config.assets.initialize_on_precompile = false
    config.filter_parameters << :password
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'

  end
end
