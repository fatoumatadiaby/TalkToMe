class AddUserIdToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :user_id, :string
  end
end
