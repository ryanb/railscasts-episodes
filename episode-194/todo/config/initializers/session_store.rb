# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_todo_session',
  :secret      => '185c738aa934b158f8baaa8215e401c89e92a7f92121b35da82eb2b6dcabc915182ab027e8f95dd52e83b7aad4e6dd432ee7d5e5e05cafd3741a11caaf010fc4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
