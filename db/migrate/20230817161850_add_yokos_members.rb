class AddYokosMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :yokos_members do |t|
      t.string :name, null: false
      # t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
