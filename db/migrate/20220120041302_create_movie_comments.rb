class CreateMovieComments < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_comments do |t|
      t.integer :movie_id
      t.integer :customer_id
      t.float :rate
      t.text :comment

      t.timestamps
    end
  end
end
