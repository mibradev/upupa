class WordCountsController < ScaffoldController
  private

  def resource_attributes
    { user: current_user }
  end
end
