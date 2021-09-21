class CreateWordCountFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :word_count_files do |t|
      t.integer :actual_word_count, null: false
      t.decimal :work_type_multiplicand, null: false
      t.decimal :total, null: false
      t.text :notes
      t.references :word_count, null: false, foreign_key: true
      t.references :work_file, null: false, foreign_key: true
      t.references :work_type, null: false, foreign_key: true
      t.timestamps
    end

    add_index :word_count_files, [:work_file_id, :work_type_id, :word_count_id], unique: true, name: "index_word_count_files_on_work_file_&_work_type_&_word_count"
  end
end
