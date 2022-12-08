class AddFieldToUsersubscription < ActiveRecord::Migration[6.1]
  def change   
    add_column :user_subscriptions, :razorpay_payment_id,:string
    add_column :user_subscriptions, :subscriptions_detail_id,:string
    add_column :user_subscriptions, :razorpay_order_id, :string
    add_column :user_subscriptions, :payment_status, :string   
  end
end
