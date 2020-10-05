# frozen_string_literal: true

class CreateWordCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :word_counts do |t|
      t.date :date, null: false
      t.integer :actual_word_count, null: false
      t.decimal :total, null: false
      t.text :notes
      t.references :work_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_index :word_counts, [:date, :user_id], unique: true
  end
end
