class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, format: URI::MailTo::EMAIL_REGEXP

  has_many :word_counts, dependent: :restrict_with_error
  has_and_belongs_to_many :roles
end
