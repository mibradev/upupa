# frozen_string_literal: true

class CreateWordCountFilesWordCountsJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :word_count_files, :word_counts do |t|
      t.index [:word_count_id, :word_count_file_id], unique: true, name: "index_word_count_files_on_word_count_id_and_word_count_file_id"
      t.index :word_count_file_id
    end
  end
end
