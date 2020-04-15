class TodosController < ApplicationController
  def create
    Todo.create(todo_params)
    redirect_to root_path
  end

  private
  def todo_params
    params.require(:todo).permit(:content).merge(user_id: current_user.id)
  end
end
