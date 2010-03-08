# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_blog_session',
  :secret => 'dfe89486e59c557e3a79f4b7cebe0b3c88ede05b3e6ae5b8ca8a6e2c4865cdb28d2b944561dc241673e2f7404af96066a896b77bdfdcc73d4a082afe29d675d8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
