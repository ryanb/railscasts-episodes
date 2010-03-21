# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_mailit_session',
  :secret => 'eef6aa87c0432b243782e1e6a67bf99a40d8b01011dac22e1cee9c76ae735289a388148b15c379313771eca6ceb8800f280b2474c30fafd33d99367a5e149757'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
