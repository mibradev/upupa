# frozen_string_literal: true

class AddWorkTypeToWordCount < ActiveRecord::Migration[6.0]
  def change
    add_reference :word_counts, :work_type, null: false, foreign_key: true
  end
end
