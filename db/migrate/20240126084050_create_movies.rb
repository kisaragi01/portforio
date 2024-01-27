class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.text :title
      t.string :youtube_url
      t.text :body
      
      t.timestamps
    end
  end
end
