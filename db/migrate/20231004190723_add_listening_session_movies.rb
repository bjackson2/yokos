class AddListeningSessionMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :listening_session_movies do |t|
      t.belongs_to :listening_session, foreign_key: true, index: true, null: false
      t.belongs_to :movie, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
