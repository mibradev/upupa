class WorkType < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}
  validates :multiplicand, presence: true
  validates :multiplicand, numericality: {allow_nil: true, greater_than: 0.0}

  has_many :word_count_files, dependent: :restrict_with_error

  def name=(value)
    super(value&.squish!)
  end
end
