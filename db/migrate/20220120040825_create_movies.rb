class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :movie_name
      t.integer :image_id
      t.string :image
      t.string :emotion
      t.string :detail
      t.string :scene

      t.timestamps
    end
  end
end
