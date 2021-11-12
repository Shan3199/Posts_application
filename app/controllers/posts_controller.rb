class PostsController < ApplicationController

	before_action :set_user
	before_action :find_post, only: [:show, :edit, :update]

 	
	
	def index
			# @posts = Post.not_current_user(current_user)
		@posts = Post.not_current_user(current_user).paginate(page: params[:page], per_page: 5)
		
		@posts_all = Post.all.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Posts",
               page_size: "A4",
               template: "posts/post.pdf.erb"
      end
    end
	end

	def show
		@likes = @post.likes.all
		@comment = @post.comments.parent_comment
		  # @post = Post.find(params[:post_id])
    # @comments = @post.comments.all
    
	end

	def generate_pdf
		@post =Post.find(params[:post_id])
		respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Posts",
               page_size: "A4",
               template: "posts/generate_pdf.html.erb"
      end
    end
		# debugger
	end
	

	def new
		@post = @user.posts.new
	end

	def create
		# debugger
		@post = @user.posts.new(post_params)
		 if @post.save
		 	PostMailer.with(post: @post).new_post_email.deliver_now
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
  	# debugger
  	Post.find(params[:id]).destroy	
  	redirect_to root_path
  end



	private

	def find_post
		# debugger
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end

	def set_user
    	@user = current_user
  end

 
end
