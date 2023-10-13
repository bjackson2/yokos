class AddSlugToListeningSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :listening_sessions, :slug, :string
    add_index :listening_sessions, :slug, unique: true
  end
end
