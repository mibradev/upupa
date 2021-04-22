class WorkTypesController < ScaffoldController
  def permitted_attributes
    [:name, :multiplicand]
  end
end
