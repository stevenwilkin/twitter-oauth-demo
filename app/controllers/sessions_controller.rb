class SessionsController < ApplicationController

	# get a request token from twitter
	def new
		client = TwitterOAuth::Client.new(
		    :consumer_key => CONSUMER_KEY,
		    :consumer_secret => CONSUMER_SECRET
		)
		request_token = client.request_token(:oauth_callback => OAUTH_CALLBACK)
		session[:request_token] = request_token.token
		session[:request_token_key] = request_token.secret
		redirect_to request_token.authorize_url
 	end

	# callback from twitter after app has been authorized
	# exchange the request token for an access token
	def auth
		client = TwitterOAuth::Client.new(
		    :consumer_key => CONSUMER_KEY,
		    :consumer_secret => CONSUMER_SECRET
		)
		access_token = client.authorize(
			session[:request_token],
			session[:request_token_key],
			:oauth_verifier => params[:oauth_verifier]
		)
		if client.authorized?
			session[:access_token] = access_token.token
			session[:access_token_secret] = access_token.secret
			session[:user_name] = client.info['name']
		end
		redirect_to root_url
	end

	# logout
	def destroy
		session[:request_token] = nil
		session[:request_token_key] = nil
		session[:access_token] = nil
		session[:access_token_secret] = nil
		session[:user_name] = nil
		redirect_to root_url
	end

end
