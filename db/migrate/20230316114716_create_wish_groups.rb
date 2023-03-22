class CreateWishGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :wish_groups do |t|
      t.references :wish, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
