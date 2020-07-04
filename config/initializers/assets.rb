# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.

# asset-pipeline configuration for JAVASCRIPTS :
Rails.application.config.assets.precompile += %w(new.js)
Rails.application.config.assets.precompile += %w(valutation.js)
Rails.application.config.assets.precompile += %w(ol.js)
Rails.application.config.assets.precompile += %w(lightbox-plus-jquery.min.js)
Rails.application.config.assets.precompile += %w(vue.min.js)
# asset-pipeline configuration for STYLESHEETS :
Rails.application.config.assets.precompile += %w(homePage.css)
Rails.application.config.assets.precompile += %w(details.css)
Rails.application.config.assets.precompile += %w(star_style.css)
Rails.application.config.assets.precompile += %w(ol.css)
Rails.application.config.assets.precompile += %w(lightbox.min)
Rails.application.config.assets.precompile += %w(new.css)
Rails.application.config.assets.precompile += %w(contact_us.css)