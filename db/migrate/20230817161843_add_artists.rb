class AddArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :file_under

      t.timestamps
    end
  end
end
