class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :disorder
      t.string :category
      t.string :resource_link
    
     

      t.timestamps
    end
  end
end
