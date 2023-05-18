class CreateKindergartens < ActiveRecord::Migration[7.0]
  def change
    create_table :kindergartens do |t|
      t.string :name
      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
