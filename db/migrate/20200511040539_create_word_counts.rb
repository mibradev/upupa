# frozen_string_literal: true

class CreateWordCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :word_counts do |t|
      t.date :date, null: false
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_index :word_counts, [:date, :user_id], unique: true
  end
end
