class AddPublishedDateToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :published_date, :date
  end
end
