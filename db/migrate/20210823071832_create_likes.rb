class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :likecount
      t.references :user, null: false, foreign_key: true
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
