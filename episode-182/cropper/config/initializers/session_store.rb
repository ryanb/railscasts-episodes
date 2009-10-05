# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cropper_session',
  :secret      => '124117a33c94dacad8dca0f01066009d03f05db38fb28fbd88cffaccbd631f743979ec8ecea9906055cbee2e29e4f5d7eb55c4ba0cb77274839f4de49b3a2e10'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
