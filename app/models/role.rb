class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  has_and_belongs_to_many :users

  def name=(value)
    super value&.squish!
  end
end
