# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :lat
      t.string :latitude
      t.string :longitude
      t.string :url_for_map

      t.timestamps
    end
  end
end
