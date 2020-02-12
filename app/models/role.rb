# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def name=(value)
    value = value.squish unless value.nil?
    super(value)
  end
end
