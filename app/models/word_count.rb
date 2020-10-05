# frozen_string_literal: true

class WordCount < ApplicationRecord
  validates :date, presence: true
  validates :date, uniqueness: { scope: :user }
  validate :date_cannot_be_in_the_future
  validates :actual_word_count, presence: true
  validates :actual_word_count, numericality: { allow_nil: true, only_integer: true, greater_than: 0 }
  validates :work_files, presence: true

  before_save :set_total

  belongs_to :user
  belongs_to :work_type
  has_and_belongs_to_many :work_files

  private
    def date_cannot_be_in_the_future
      errors.add(:date, :future_date) if date&.future?
    end

    def set_total
      self.total = actual_word_count * work_type.multiplicand
    end
end
