# frozen_string_literal: true

class WorkType < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :multiplicand, presence: true
  validates :multiplicand, numericality: { allow_nil: true }

  has_many :word_count_files

  def name=(value)
    value = value.squish unless value.nil?
    super(value)
  end
end
