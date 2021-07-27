class RemovePayjpFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    remove_column :users, :subscription_id, :string
    remove_column :users, :premium, :boolean
  end
end
