class RoleAssignment < ApplicationRecord
  validates :role, uniqueness: {scope: :user}

  belongs_to :role
  belongs_to :user
end
