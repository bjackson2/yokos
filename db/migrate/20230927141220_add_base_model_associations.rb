class AddBaseModelAssociations < ActiveRecord::Migration[7.0]
  def change
    unless column_exists? :albums, :artist_id
      add_reference :albums, :artist
    end

    unless column_exists? :listening_session_albums, :album_id
      add_reference :listening_session_albums, :album, foreign_key: true, index: true, null: false
    end

    unless column_exists? :listening_session_albums, :yokos_member_id
      add_reference :listening_session_albums, :yokos_member, foreign_key: true, index: true
    end

    unless column_exists? :yokos_members, :user_id
      add_reference :yokos_members, :user, foreign_key: true, null: false
    end
  end
end
