class WordCount < ApplicationRecord
  validates :date, presence: true
  validates :date, uniqueness: {scope: :user}
  validate :date_cannot_be_in_the_future

  belongs_to :user
  has_many :word_count_files, dependent: :restrict_with_error

  def day
    I18n.localize(date, format: "%A")
  end

  private

  def date_cannot_be_in_the_future
    errors.add(:date, :future_date) if date&.future?
  end
end
