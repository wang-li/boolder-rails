# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# CORS policy to prevent errors with Cloudfront CDN
# https://devcenter.heroku.com/articles/using-amazon-cloudfront-cdn#amazon-cloudfront
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['boolder.com', 'www.boolder.com']
    resource '*', headers: :any, methods: [:get, :head, :options]
  end
end