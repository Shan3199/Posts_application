class PostsController < ApplicationController

	before_action :set_user
	before_action :find_post, only: [:show, :edit, :update, :destroy]

 	
	
	def index
			# @posts = Post.not_current_user(current_user)
			@posts = Post.not_current_user(current_user).paginate(page: params[:page], per_page: 5)
	end

	def show
		@comment = @post.comments.all
	end
	

	def new
		@post = @user.posts.new
	end

	def create
		# debugger
		@post = @user.posts.new(post_params)
		 if @post.save
      		redirect_to root_path
    	else
      		render :new
    	end
	end

	def edit

  end

	def update
	if @post.update(post_params)
	      redirect_to root_path
	    else
	      render :edit
	    end
  	end

  def destroy
    @post.destroy
  	redirect_to root_path
  end



	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def set_user
    	@user = current_user
  end

 
end
