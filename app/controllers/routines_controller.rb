class RoutinesController < ApplicationController
  def create
    for num in 1..routine_params[:turn].to_i do
      @routine = Routine.create(routine_params)
    end
    redirect_to root_path
  end

  def destroy_all
    Routine.destroy_all(['user_id = ?', current_user.id])
    redirect_to root_path
  end

  private
  def routine_params
    params.require(:routine).permit(:content, :turn).merge(user_id: current_user.id)
  end
end
