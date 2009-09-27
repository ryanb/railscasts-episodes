# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_commentator_session',
  :secret      => '52bc2b320cd7b5e0975f19d54841c9921a967e43284327bbc89cdec31e57e9ad8a95a808cb1cdc2f6d6e2083fc548c624382cc616ad7c610abfc085a2cea9b08'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
