class AddLikeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :like, :boolean
    add_column :users, :likes, :integer
  end
end
