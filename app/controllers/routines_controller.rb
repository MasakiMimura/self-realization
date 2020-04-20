class RoutinesController < ApplicationController
  def create
    Routine.create(routine_params)
    redirect_to root_path
  end

  private
  def routine_params
    params.require(:routine).permit(:content).merge(user_id: current_user.id)
  end
end
