class WordCountFile < ApplicationRecord
  validates :actual_word_count, presence: true
  validates :actual_word_count, numericality: { allow_nil: true, only_integer: true, greater_than: 0 }
  validates :word_counts, presence: true

  before_save :set_work_type_multiplicand, if: :new_record?
  before_save :set_total

  belongs_to :work_file
  belongs_to :work_type
  has_and_belongs_to_many :word_counts

  private

  def set_work_type_multiplicand
    self.work_type_multiplicand = work_type.multiplicand
  end

  def set_total
    self.total = actual_word_count * work_type_multiplicand
  end
end
