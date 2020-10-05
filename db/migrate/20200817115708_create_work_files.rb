# frozen_string_literal: true

class CreateWorkFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :work_files do |t|
      t.string :name
      t.timestamps
    end

    add_index :work_files, :name, unique: true
  end
end
