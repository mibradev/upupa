class User < ApplicationRecord
  has_secure_password validations: false

  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, format: URI::MailTo::EMAIL_REGEXP, allow_blank: true
  validates :password, presence: true, unless: -> { password.nil? }
  validates :password, length: {minimum: 8, maximum: 128}, unless: -> { password.nil? }
  validates :password, confirmation: true

  has_many :word_counts, dependent: :restrict_with_error
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  def has_role?(name)
    roles.any? { |role| role.name == name }
  end

  def admin?
    has_role? "Admin"
  end
end
