class AddFieldToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions,:subscription_status,:integer ,default:0
  end
end
