class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      @user = current_user
      @posts = @user.posts.all
    else
      @posts = Post.all
    end
  end
    




end
