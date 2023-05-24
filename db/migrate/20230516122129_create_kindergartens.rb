class CreateKindergartens < ActiveRecord::Migration[7.0]
  def change
    create_table :kindergartens do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.decimal :latitude, null: false
      t.decimal :longitude, null: false

      t.timestamps
    end
  end
end
