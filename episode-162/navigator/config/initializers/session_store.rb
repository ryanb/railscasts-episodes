# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_navigator_session',
  :secret      => '2145140a782150842522ac342a1ca2fc7f1570c0cbfcd1a65bd137d4ba483fad9d1f173492103eaf16f844c4abeed2587091099c4730552eed87e8676fc7e567'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
