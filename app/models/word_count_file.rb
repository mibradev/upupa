class WordCountFile < ApplicationRecord
  validates :actual_word_count, presence: true
  validates :actual_word_count, numericality: {only_integer: true, greater_than: 0}, allow_blank: true
  validates :work_file, uniqueness: {scope: [:word_count, :work_type]}

  belongs_to :word_count
  belongs_to :work_file
  belongs_to :work_type

  def notes=(value)
    super value&.strip
  end

  def total
    actual_word_count * work_type.multiplicand
  end
end
