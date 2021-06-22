class WordCountFile < ApplicationRecord
  validates :actual_word_count, presence: true
  validates :actual_word_count, numericality: {allow_nil: true, only_integer: true, greater_than: 0}
  validates :work_file, uniqueness: {scope: [:work_type, :word_count]}

  before_save :set_work_type_multiplicand, if: :new_record?
  before_save :set_total

  belongs_to :word_count
  belongs_to :work_file
  belongs_to :work_type

  private

  def set_work_type_multiplicand
    self.work_type_multiplicand = work_type.multiplicand
  end

  def set_total
    self.total = actual_word_count * work_type_multiplicand
  end
end
