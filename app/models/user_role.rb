class UserRole < ApplicationRecord
  validates :role, uniqueness: {scope: :user}

  belongs_to :user
  belongs_to :role
end
