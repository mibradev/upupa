# frozen_string_literal: true

class CreateWordCountFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :word_count_files do |t|
      t.string :name

      t.timestamps
    end

    add_index :word_count_files, :name, unique: true
  end
end
