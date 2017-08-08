class ManagePanelController < ApplicationController
  def index
    @bicycles = Bicycle.all
    @my_suggestions = BicycleSuggestion.where(user_id: current_user.id)
  end

  def show
    @suggestion = BicycleSugestion.find(params[:id])
  end
end
