class CreateWorkFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :work_files do |t|
      t.string :name
      t.timestamps
    end

    add_index :work_files, :name, unique: true
  end
end
