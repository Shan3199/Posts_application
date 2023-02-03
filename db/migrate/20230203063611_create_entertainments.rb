class CreateEntertainments < ActiveRecord::Migration[6.1]
  def change
    create_table :entertainments do |t|
      t.string :name

      t.timestamps
    end
  end
end
