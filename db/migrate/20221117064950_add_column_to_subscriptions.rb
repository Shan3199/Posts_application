class AddColumnToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :rozarpay_plan_id, :string
    add_column :subscriptions, :subscription_id , :string
    add_column :subscriptions, :razorpay_payment_id,:string

  end
  
end
