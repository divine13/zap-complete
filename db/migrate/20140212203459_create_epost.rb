class CreateEpost < ActiveRecord::Migration
  def change
    create_table :eposts do |t|
      t.string :about
      t.references :user, index: true

       t.timestamps
    end
  end
end
