class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_id, null: false
      t.string :number, null: false
      t.string :brand, null: false
      t.boolean :default, default: false, null: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
