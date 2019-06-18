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
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w(
                                                theme.scss
                                                print.scss

                                                turn.js
                                                turn.min.js
                                                turn.html4.js
                                                turn.html4.min.js
                                                hash.js
                                                scissor.js
                                                scissor.min.js
                                                zoom.js
                                                zoom.min.js

                                                jgestures.min.js
                                                jquery-ui-1.8.20.custom.min.js
                                                jquery.mousewheel.min.js
                                                modernizr.2.5.3.min.js
                                                )

Rails.application.config.assets.precompile += %w(
                                                logo.png
                                                logo-white.png
                                                logo-black.png
                                                brain.png
                                                brain-white.png
                                                brain-black.png
                                                name.png
                                                name-white.png
                                                name-black.png

                                                joy.png
                                                angry.png
                                                sadness.png
                                                scary.png

                                                Lilyan.png
                                                Ellyson.png

                                                filterrific/filterrific-spinner.gif

                                                *.png
                                                *.jpg
                                              )
