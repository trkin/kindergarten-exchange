class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :location, null: false, foreign_key: true
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
