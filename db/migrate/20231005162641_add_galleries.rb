class AddGalleries < ActiveRecord::Migration[7.0]
  def change
    create_table :galleries do |t|
      t.string :name, null: false
      t.text :notes

      t.timestamps
    end
  end
end
