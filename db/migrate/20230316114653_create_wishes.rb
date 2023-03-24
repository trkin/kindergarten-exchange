# frozen_string_literal: true

class CreateWishes < ActiveRecord::Migration[7.0]
  def change
    create_table :wishes do |t|
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
