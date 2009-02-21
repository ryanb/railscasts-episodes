# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_processes_session',
  :secret      => '568511d5543936cbbf68f9f3a183e9ef395b96e1d2a4e048fd0edd03272bd8114a538d5f1bd29c145c36a9db0dddc3b56277d6d086bca7d5596176bb7068a8bc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
