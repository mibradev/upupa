class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  before_update :cannot_change_a_system_role
  before_destroy :cannot_change_a_system_role

  has_and_belongs_to_many :users

  def name=(value)
    super value&.squish!
  end

  private

  def cannot_change_a_system_role
    return unless system_role?
    errors.add :base, :system_role
    throw :abort
  end
end
