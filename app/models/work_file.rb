# frozen_string_literal: true

class WorkFile < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :word_count_files

  def name=(value)
    value = value.squish unless value.nil?
    super(value)
  end
end
