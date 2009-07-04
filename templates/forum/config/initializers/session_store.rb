# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_forum_session',
  :secret      => 'a707735bcd2877866b5cc15ce6b5bc0f74e71a9469eae73e669b48f0133c2fad1e8db3aa23b1692850eff2e2eb678920c93773ff5dd8d97625a7f272082bc3a8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
