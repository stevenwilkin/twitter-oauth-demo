class SessionsController < ApplicationController

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

  def destroy
  end

end
