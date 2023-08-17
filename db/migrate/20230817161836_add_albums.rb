class AddAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :file_under
      t.date :release_date, null: false

      t.belongs_to :artist

      t.timestamps
    end
  end
end
