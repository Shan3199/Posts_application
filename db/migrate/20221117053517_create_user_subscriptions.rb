class CreateUserSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_subscriptions do |t|
      t.references :user
      t.references :subscription
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
