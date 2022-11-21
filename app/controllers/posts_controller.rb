class PostsController < ApplicationController

 	skip_before_action :verify_authenticity_token
	before_action :set_user 
	before_action :find_post, only: [:show, :edit, :update]


	
	def index
			# @posts = Post.not_current_user(current_user)
			#@posts = Post.not_current_user(current_user).paginate(page: params[:page], per_page: 5)
			@posts = Post.where.not(user_id:current_user).paginate(page: params[:page], per_page: 5)
	end

	def show
		@likes = @post.likes.all
		@comment = @post.comments.parent_comment
		  # @post = Post.find(params[:post_id])
    # @comments = @post.comments.all    
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
  	
 		 @post = Post.find(params[:user_id])
  	 @post.destroy
  	 redirect_to root_path, status: :see_other
  end


def sub
	para_attr = {
	  "plan_id": "#{params[:plan_id]}",
	  "total_count": 12,
	  "quantity": 1,
	  "customer_notify": 1,
	  "notify_info": {
	    "notify_phone": 9123456789,
	    "notify_email": "gaurav.kumar@example.com"
	  }
	}
	subscription = Razorpay::Subscription.create(para_attr)
	#Subscription.create(subscription_id:subscription.id)
  redirect_to payment_path(subscription_id:subscription.id)
end


 def payment
  @subscription = Subscription.find_by(subscription_id:params[:subscription_id])

	#redirect_to payment.as_json["attributes"]["short_url"]


 end

def success
 razorpay_payment_id = params[:razorpay_payment_id]
 razorpay_subscription_id = params[:razorpay_subscription_id]
 razorpay_signature = params[:razorpay_signature]

  if Razorpay::Utility.verify_payment_signature(razorpay_payment_id:razorpay_payment_id, razorpay_subscription_id:razorpay_subscription_id,razorpay_signature:razorpay_signature)
	 @success = "payment is successful"
	end

end






private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end

	def set_user
    @user = current_user
  end

  def subscribe_params
   params.require.permit(:total_count,:quantity,:expire_by,:customer_notify)
  end


end







 para_attr = {
  "amount": 500,
  "currency": "INR",
  "accept_partial": true,
  "description": "For XYZ purpose",
  "customer": {
    "name": "Gaurav Kumar",
    "email": "gaurav.kumar@example.com",
    "contact": "+919999999999"
  },
  "notify": {
    "sms": true,
    "email": true
  },

  "callback_url": "",
  "callback_method": "get"
}
