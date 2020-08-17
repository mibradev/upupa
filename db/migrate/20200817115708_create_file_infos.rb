# frozen_string_literal: true

class CreateFileInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :file_infos do |t|
      t.string :name

      t.timestamps
    end

    add_index :file_infos, :name, unique: true
  end
end
