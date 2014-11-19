# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

# CSS
Rails.application.config.assets.precompile += %w( welcome.css variables.css devise.css users.css jobs.css childcare_surveys.css petcare_surveys.css offers.css comments.css)

# JS
Rails.application.config.assets.precompile += %w( devise.js navbar.js users.js jobs.js childcare_surveys.js petcare_surveys.css offers.js comments.js)
