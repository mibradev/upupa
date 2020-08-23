# frozen_string_literal: true

class WordCountFile < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :word_counts

  def name=(value)
    value = value.strip unless value.nil?
    super(value)
  end
end
