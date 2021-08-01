class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.string :price, null: false
      t.string :plan_id, null: false

      t.timestamps
    end
  end
end
