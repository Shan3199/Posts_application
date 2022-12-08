class RemoveFieldFromSubscriptions < ActiveRecord::Migration[6.1]
  def change   
    remove_column :subscriptions, :razorpay_payment_id
    remove_column :subscriptions, :subscription_id
  end
end
  
 