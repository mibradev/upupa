class CreateUserRolesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.index [:user_id, :role_id], unique: true
      t.timestamps
    end
  end
end
