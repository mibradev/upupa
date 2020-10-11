# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable
  devise :validatable

  has_many :word_counts
  has_and_belongs_to_many :roles
end
