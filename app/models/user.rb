class User < ApplicationRecord
  has_secure_password validations: false

  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :password, presence: true, unless: -> { password.nil? }
  validates :password, length: {minimum: 8, maximum: 128}, unless: -> { password.nil? }
  validates :password, confirmation: true

  has_many :word_counts, dependent: :restrict_with_error
  has_and_belongs_to_many :roles

  def has_role?(name)
    roles.any? { |role| role.name == name }
  end
end
