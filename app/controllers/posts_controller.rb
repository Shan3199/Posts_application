class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token, except: [:get_photo]
  before_action :set_user, except: [:get_photo]
  before_action :find_post, only: [:show, :edit, :update]

  def index
    @posts = Post.where.not(user_id:current_user).paginate(page: params[:page], per_page: 5)
  end

  def show
    @likes = @post.likes.all
    @comment = @post.comments.parent_comment    
  end

  def new
    @post = @user.posts.new
  end

  def create
    @post = @user.posts.new(post_params)
      if @post.save
        redirect_to root_path
      else
        render :new
      end
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
     render :edit
    end
  end


  def destroy  	
    @post = Post.find_by(id: params[:id], user_id: params[:user_id])
    @post.destroy
    redirect_to root_path, status: :see_other
  end

  def subscription
   
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
    @subscription = Razorpay::Subscription.create(para_attr)
  end

  def success
    # debugger
    subscription = Subscription.last
    if params[:razorpay_order_id].present?
      razorpay_payment_id = params[:razorpay_payment_id]
      razorpay_order_id  = params[:razorpay_order_id]   
      razorpay_signature = params[:razorpay_signature]    
      if Razorpay::Utility.verify_payment_signature(razorpay_payment_id:razorpay_payment_id, razorpay_order_id:razorpay_order_id,razorpay_signature:razorpay_signature)
       current_user.user_subscriptions.create(razorpay_payment_id:razorpay_payment_id, razorpay_order_id:razorpay_order_id,subscription_id:subscription.id,subscriptions_detail_id:"nil", status:"active")
        # UpdatePaymentStatusJob.perform_later(
        #   current_user)
        @success = "payment is successful"
      end
    else
      razorpay_payment_id = params[:razorpay_payment_id]
      razorpay_subscription_id = params[:razorpay_subscription_id]
      razorpay_signature = params[:razorpay_signature]
        if Razorpay::Utility.verify_payment_signature(razorpay_payment_id:razorpay_payment_id, razorpay_subscription_id:razorpay_subscription_id,razorpay_signature:razorpay_signature)
          # current_user.subscriptions.create(subscription_id:razorpay_subscription_id,razorpay_payment_id:razorpay_payment_id)
          current_user.user_subscriptions.create(subscriptions_detail_id:razorpay_subscription_id,razorpay_payment_id:razorpay_payment_id, subscription_id:subscription.id, status:"active")
          @success = "payment is successful"
        end
    end
  end


  def pay
    para_attr = {
    "amount": 20000,
    "currency": "INR",
    "receipt": "receipt#1",
    # "notes": {
    #   "key1": "value3",
    #   "key2": "value2"
    #     }
      }      
     @order = Razorpay::Order.create(para_attr)

  end

  def get_photo
    user_photo =  Rails.application.routes.url_helpers.url_for(Entertainment.order("RANDOM()").first.photo)
    render json: {data: user_photo}
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
