# frozen_string_literal: true

class CreateWordCountsWorkFilesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :word_counts, :work_files do |t|
      t.index [:word_count_id, :work_file_id], unique: true
      t.index :work_file_id
    end
  end
end
