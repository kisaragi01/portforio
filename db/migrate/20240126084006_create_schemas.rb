class CreateSchemas < ActiveRecord::Migration[5.2]
  def change
    create_table :schemas do |t|
      t.text :name
      t.string :image_id
      t.text :introduction
      t.integer :user_id
      
      t.timestamps
    end
  end
end
