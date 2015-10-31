# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w(creative.css.scss.erb creative.css font-awesome.css font-awesome.min.css animate.min.css css.css animate.min.css application.scss appointments.scss cdd(1) dogs.scss font-awesome.min.css welcome.scss *.scss)
Rails.application.config.assets.precompile += %w( *.js doggie.jpg shampoo.jpg *.jpg *.woff *.tff)
