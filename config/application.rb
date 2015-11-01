require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Groomer
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    # On Heroku, you must set this line in your config/application.rb:
    config.assets.initialize_on_precompile = true

    Rails.application.config.assets.precompile += %w(creative.css.scss.erb creative.css font-awesome.css font-awesome.min.css animate.min.css css.css animate.min.css application.scss appointments.scss cdd(1) dogs.scss font-awesome.min.css welcome.scss *.scss)
    Rails.application.config.assets.precompile += %w( *.js doggie.jpg shampoo.jpg *.jpg *.woff fontawesome-webfont.ttf *.ttf)
 end
end
