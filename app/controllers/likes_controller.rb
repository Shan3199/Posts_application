class LikesController < ApplicationController
  before_action :find_post_comment
  before_action :find_like, only: [:destroy]

  def index
      @likes = @likeable.likes
  end

  def create
    if already_liked?
      flash[:alert] = "You already have liked"
    else
      @post = Post.find(params[:post_id])
      @like = @likeable.likes.new(likecount: 0,user_id: current_user.id)
      if @like.save
        respond_to do |format|    
          format.js 
        end
      else
        # render 'new'
      end 
    end
  end

  def destroy
    if already_liked?
      @like.destroy
      respond_to do |format|
        format.js
      end
    end
    # redirect_to posts_path
  end

  private

  def find_post_comment
    @likeable = params[:post_id].present? ? Post.find(params[:post_id]) : Comment.find(params[:comment_id])
  end

  def already_liked?
  	@likeable.likes.where(user_id: current_user.id).present?
  end

  def find_like
    # @likeable.likes.find(params[:id])
    if params[:post_id]
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
    else
      @comment = Comment.find(params[:comment_id])
      @like = @comment.likes.find(params[:id])
    end
  end

end
