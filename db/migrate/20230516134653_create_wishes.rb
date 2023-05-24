class CreateWishes < ActiveRecord::Migration[7.0]
  def change
    create_table :wishes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :kindergarten, null: false, foreign_key: true
      t.string :group, null: false

      t.timestamps
    end
  end
end
