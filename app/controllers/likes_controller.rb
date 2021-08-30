class LikesController < ApplicationController
  before_action :find_post_comment
  before_action :find_like, only: [:destroy]

  def index
      #@comment = Comment.find(params[:comment_id])
      @likes = @likeable.likes
  end

  def create
  	# if already_liked?
  	# 	flash[:alert] = "You already have liked"
  	# elsif @post
   # 	 	@post.likes.create(likecount: 0,user_id: current_user.id) 
   # 	 	flash[:notice] = "Post liked"
   # 	 	redirect_to posts_path
   # 	else
   # 		 @comment.likes.create(likecount: 2,user_id: current_user.id)
   # 		 	flash[:notice] = "comment liked" 
   # 		 redirect_to posts_path  		
  	# end
    if already_liked?
      flash[:alert] = "You already have liked"
    else
      @like = @likeable.likes.new(likecount: 0,user_id: current_user.id)
      if @like.save
        # flash[:notice] = "Post liked"
        # redirect_to posts_path
      else
        # render 'new'
      end 
    end
  end

  def destroy
    # debugger
    if already_liked?
      @like.destroy
    end
    # redirect_to posts_path
  end

  private
  def find_post_comment
  	# debugger
    @likeable = params[:post_id].present? ? Post.find(params[:post_id]) : Comment.find(params[:comment_id])
  # 	if params[:post_id]
  #   	@post = Post.find(params[:post_id])
		# else
	 #   	@comment = Comment.find(params[:comment_id])
		# end
  end

  def already_liked?
  	@likeable.likes.where(user_id: current_user.id).present?
   #  if params[:post_id]
  	# 	Like.where(likecount: 0, user_id: current_user, likeable_id: @post).exists?
  	# else
  	# 	Like.where(likecount: 2, user_id: current_user, likeable_id: @comment).exists?
  	# end
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
