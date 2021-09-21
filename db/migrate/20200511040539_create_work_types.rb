class CreateWorkTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :work_types do |t|
      t.string :name
      t.decimal :multiplicand
      t.timestamps
    end

    add_index :work_types, :name, unique: true
  end
end
