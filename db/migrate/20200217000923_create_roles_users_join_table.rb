class CreateRolesUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :roles, :users do |t|
      t.index [:user_id, :role_id], unique: true
      t.index :role_id
    end
  end
end
