class AddListeningSessionAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :listening_session_albums do |t|
      t.belongs_to :listening_session, foreign_key: true, index: true, null: false
      t.belongs_to :album, foreign_key: true, index: true, null: false
      t.belongs_to :yokos_member, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
