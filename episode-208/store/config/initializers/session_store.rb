# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_store_session',
  :secret => '016f2d0ddfd75f2cd01a4d2f5310656456c2614801ef0dc831f6226782e8ea9df4efbb0f5b813ff1d6f0b38bc8f7f358bd5f8f28ad79de6d95b8bb702bbaff1b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
