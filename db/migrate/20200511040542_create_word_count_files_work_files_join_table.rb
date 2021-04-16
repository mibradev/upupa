class CreateWordCountFilesWorkFilesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :word_count_files, :work_files do |t|
      t.index [:word_count_file_id, :work_file_id], unique: true, name: "index_word_count_files_on_word_count_file_id_and_work_file_id"
      t.index :work_file_id
    end
  end
end
