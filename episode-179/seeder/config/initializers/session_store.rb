# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_seeder_session',
  :secret      => 'dd6bb25b07a5d872d6e7b92f1f1f59fb8ee171697773b78d72fc5ab448eabc1fe4e4836b9a1694f0b9672b630a6cb6c576da102c8c4b250a68f7f180add04513'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
