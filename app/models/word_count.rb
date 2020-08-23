# frozen_string_literal: true

class WordCount < ApplicationRecord
  validates :date, presence: true
  validates :date, uniqueness: { scope: :user }
  validate :date_cannot_be_in_the_future
  validates :actual_word_count, presence: true
  validates :actual_word_count, numericality: { allow_nil: true, only_integer: true, greater_than: 0 }
  validates :word_count_files, presence: true

  belongs_to :user
  has_and_belongs_to_many :word_count_files

  private
    def date_cannot_be_in_the_future
      errors.add(:date, :future_date) if date&.future?
    end
end
