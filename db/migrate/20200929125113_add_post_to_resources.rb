class AddPostToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :post_id, :integer
  end
end
