require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    #config.i18n.default_locale = :en
    config.time_zone = "Ekaterinburg"

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.default_locale = :ru
    config.autoload_paths << "#{Rails.root}/lib/clients"
    config.assets.initialize_on_precompile = false
  end
end
