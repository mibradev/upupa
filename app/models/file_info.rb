# frozen_string_literal: true

class FileInfo < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def name=(value)
    value = value.strip unless value.nil?
    super(value)
  end
end
