class WordCountPolicy < ApplicationPolicy
  def permitted_attributes
    [:date, :notes]
  end
end
