class CreateEcomments < ActiveRecord::Migration
  def change
    create_table :ecomments do |t|
      t.text :text
      t.references :epost, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
