require 'dragonfly'

# Configure
Dragonfly.app.configure do
  #plugin :imagemagick

  secret "e9b029cf4c2203f27687b126bc4be8fb8db743dff641e75d0724663c8460c758"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
