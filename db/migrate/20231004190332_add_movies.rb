class AddMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :file_under
      t.integer :release_year, null: false
      t.belongs_to :artist, foreign_key: true

      t.timestamps
    end
  end
end
