require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
end
