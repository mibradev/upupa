class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :users

  def name=(value)
    value.squish! unless value.nil?
    super(value)
  end
end
