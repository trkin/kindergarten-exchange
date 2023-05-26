class CreateWishKindergartens < ActiveRecord::Migration[7.0]
  def change
    create_table :wish_kindergartens do |t|
      t.references :wish, null: false, foreign_key: true
      t.references :kindergarten, null: false, foreign_key: true

      t.timestamps
    end
  end
end
