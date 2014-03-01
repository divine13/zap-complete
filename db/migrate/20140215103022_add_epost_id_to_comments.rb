class AddEpostIdToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :epost_id, :integer
  end
end
