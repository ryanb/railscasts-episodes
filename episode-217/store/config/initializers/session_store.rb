# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_store_session',
  :secret      => 'fea3c13c1cf4d03b820d1c8de9cee99b54603df2dd8e5b6d1bfc630ff446f91f62d9ca36f23b4bd124727d873339ba8b3f6024d976ccba31b66708259cf36e6c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
