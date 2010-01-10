# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_surveysays_session',
  :secret      => 'a4e0bbce55c0cfc4b4a1471955f38c32f003f22d745470b349e357656a8660b296e117ab9a59af9b1bfd2cb9d4297b74aa34d97be336fd3afdf91ad8031fe23f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
