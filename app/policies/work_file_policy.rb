class WorkFilePolicy < ApplicationPolicy
  def permitted_attributes
    [:name]
  end
end
