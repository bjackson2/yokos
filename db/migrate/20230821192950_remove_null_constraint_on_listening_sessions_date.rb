class RemoveNullConstraintOnListeningSessionsDate < ActiveRecord::Migration[7.0]
  def change
    change_column_null :listening_sessions, :date, true
  end
end
