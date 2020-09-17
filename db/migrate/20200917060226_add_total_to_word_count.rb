# frozen_string_literal: true

class AddTotalToWordCount < ActiveRecord::Migration[6.0]
  def change
    add_column :word_counts, :total, :decimal, null: false
  end
end
