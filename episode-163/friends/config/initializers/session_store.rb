# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_friends_session',
  :secret      => '65769c1d198b451dd6a98a6e3fa339401d92606cc12bf8ef4cbadbccc6e25639bc2fb27b236fd916d841dbbdddf465057caef5d86f0510e1574cbc965a8699a2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
