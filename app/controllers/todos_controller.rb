class TodosController < ApplicationController
  def create
    @todo = Todo.create(todo_params)
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render json: @todo}
    end
  end

  def destroy
    post = Todo.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def todo_params
    params.require(:todo).permit(:content).merge(user_id: current_user.id)
  end
end
