# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vet_session',
  :secret      => '2308b367f5e17a17f39ef86f50894a1ecfc2ba326443e9274785bb621fffbbec019e434d6eafb873f875c977cb8a856e414cfa3b75f3897cd0be9447ac85039f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
