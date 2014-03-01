class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :like
      t.integer :epost_id
      t.integer :post_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :epost_id
    add_index :likes, :post_id

    add_index :likes, [:user_id, :epost_id], unique: true

    add_index :likes, [:user_id, :post_id], unique: true
  end
end
