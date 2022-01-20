class WorkType < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}
  validates :multiplicand, presence: true
  validates :multiplicand, numericality: {greater_than: 0.0}, allow_blank: true

  has_many :word_count_files, dependent: :restrict_with_error

  def name=(value)
    super value&.squish
  end
end
