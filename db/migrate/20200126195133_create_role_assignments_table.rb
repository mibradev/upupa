class CreateRoleAssignmentsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :role_assignments do |t|
      t.references :role, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_index :role_assignments, [:role_id, :user_id], unique: true
  end
end
