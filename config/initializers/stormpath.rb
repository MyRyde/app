Stormpath::Rails.configure do |config|
  config.api_key.id = ENV['STORMPATH_API_KEY_ID']
  config.api_key.secret = ENV['STORMPATH_API_KEY_SECRET']
  config.application.href = ENV['STORMPATH_URL']
end