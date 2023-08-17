class AddYokosMemberListeningSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :yokos_member_listening_sessions do |t|
      t.belongs_to :yokos_member, foreign_key: true, index: true
      t.belongs_to :listening_session, foreign_key: true, index: true

      t.timestamps
    end
  end
end
