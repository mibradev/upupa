class WorkTypePolicy < ApplicationPolicy
  def permitted_attributes
    [:name, :multiplicand]
  end
end
