class CreateWordCountFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :word_count_files do |t|
      t.integer :actual_word_count, null: false
      t.decimal :work_type_multiplicand, null: false
      t.decimal :total, null: false
      t.text :notes
      t.references :work_type, null: false, foreign_key: true
      t.timestamps
    end
  end
end
