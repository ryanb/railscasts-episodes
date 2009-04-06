# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_authenticator_session',
  :secret      => 'c3f94a2a0d37b8635371cb2eadf63bcd0339c78c95976e7e22713c9f9cc4f479dd372fa4a5f010628f5601585e7b56800f1c0a9ca6b3d052d372eafdc50e174e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
