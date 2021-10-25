class WelcomeController < ApplicationController
  require 'twilio-ruby'
	skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
    # boot_twilio
    # debugger
    # sms = @client.messages.create(
    #   from: ENV['TWILIO_FROM_PHONE_NUMBER'],
    #   to: '+918839425551',
    #   body: "Logged in successfully"
    # )		
      @user = current_user
      @posts = @user.posts.all
    else
      @posts = Post.all
    end
  end
    
private

  def boot_twilio
  	debugger	
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end


end
