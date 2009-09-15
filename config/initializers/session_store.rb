# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oauth_session',
  :secret      => 'a466ea4c8d2f3a1858f99cc988546f5923d8de3c1d88d5d42b7f0be29edb75b3894d34604a423a0e404ff3743cd568523b376d88374aa9d540a59b555607fb80'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
