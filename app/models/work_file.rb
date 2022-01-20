class WorkFile < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  has_many :word_count_files, dependent: :restrict_with_error

  def name=(value)
    super value&.squish
  end
end
