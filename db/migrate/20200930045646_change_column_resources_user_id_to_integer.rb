class ChangeColumnResourcesUserIdToInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :resources, :user_id, :integer
  end
end
