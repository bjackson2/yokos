class AddListeningSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :listening_sessions do |t|
      t.date :date, null: false
      t.string :session_type, null: false
      t.string :theme
      t.text :notes
      
      t.timestamps
    end
  end
end
