# frozen_string_literal: true

class WordCountFile < ApplicationRecord
  validates :actual_word_count, presence: true
  validates :actual_word_count, numericality: { allow_nil: true, only_integer: true, greater_than: 0 }
  validates :work_files, presence: true
  validates :word_counts, presence: true

  before_save :set_total

  belongs_to :work_type
  has_and_belongs_to_many :work_files
  has_and_belongs_to_many :word_counts

  private
    def set_total
      self.total = actual_word_count * work_type.multiplicand
    end
end
