class User < ApplicationRecord
  has_secure_password validations: false

  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :email, format: URI::MailTo::EMAIL_REGEXP, allow_blank: true
  validates :password, presence: true, allow_nil: true
  validates :password, length: {minimum: 8, maximum: MAX_PASSWORD_LENGTH_ALLOWED}, allow_blank: true
  validates :password, confirmation: true

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  has_many :word_counts, dependent: :restrict_with_error

  def email=(value)
    super value&.strip
  end

  def has_role?(name)
    roles.any? { |role| role.name == name }
  end

  def admin?
    has_role? "Admin"
  end

  def manager?
    has_role? "Manager"
  end

  def project_manager?
    has_role? "Project Manager"
  end

  def translator?
    has_role? "Translator"
  end
end
