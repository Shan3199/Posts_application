class CommentsController < ApplicationController
  def index

    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
    @likes = @post.likes.all
 
  end


  def new 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new  
  end


  def create
    # debugger
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.new(comment_params)
      @comment.post = @post
      if @comment.save
        #flash.now[:notice] = "created"
        redirect_to posts_path
      else
        #flash.now[:error] = @comment.errors.full_messages
        render 'new'
      end


  end

  def edit
    debugger
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  def new_reply
    # debugger
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id])
    @new_comment = @comment.replies.new  
  end

  def create_reply
    # debugger
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.new(reply_params)

    if @reply.save
      redirect_to root_path
    else
      # debugger
        render 'new_reply'
    end
  end


  private

  def comment_params
    # debugger
    params.require(:comment).permit(:post_id,:text)
  end

  def reply_params
    # debugger
    params.require(:comment).permit(:user_id, :text, :post_id)
    
  end
end 
