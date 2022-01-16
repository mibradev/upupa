class Permission < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  def name=(value)
    super value&.squish!
  end
end
