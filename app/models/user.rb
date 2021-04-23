class User < ApplicationRecord
  devise :database_authenticatable
  devise :validatable

  has_many :word_counts, dependent: :restrict_with_error
  has_and_belongs_to_many :roles
end
