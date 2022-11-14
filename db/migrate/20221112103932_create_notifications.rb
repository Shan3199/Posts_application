class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :headings
      t.string :contents
      t.integer :created_by
      t.references :user, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
