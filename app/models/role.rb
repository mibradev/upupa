class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  has_many :role_assignments, dependent: :destroy
  has_many :users, through: :role_assignments

  def name=(value)
    super value&.squish
  end
end
