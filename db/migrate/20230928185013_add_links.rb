class AddLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :text
      t.string :uri, null: false, default: ""

      t.belongs_to :owner, polymorphic: true, index: true, null: false

      t.timestamps
    end
  end
end
