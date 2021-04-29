class WordCountFilePolicy < ApplicationPolicy
  def permitted_attributes
    [:actual_word_count, :notes]
  end
end
