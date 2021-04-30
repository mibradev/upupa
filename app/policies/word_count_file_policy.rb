class WordCountFilePolicy < ApplicationPolicy
  def permitted_attributes
    [:actual_word_count, :notes, :work_type_id]
  end
end
