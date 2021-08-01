class ChangeColumnAddNotnullOnCards < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cards, :user_id, false
  end
end
