class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  def name=(value)
    super value&.squish!
  end
end
