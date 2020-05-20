class PostsController < ApplicationController
    def index
    @post = Post.new
    @posts = Post.where(user: current_user.id).order('created_at ASC').includes(:user)

    @favorite = Favorite.new
    @favorites = Favorite.where(user: current_user.id).order('rank ASC').includes(:user)

    @todo = Todo.new
    @todos = Todo.where(user: current_user.id).order('created_at ASC').includes(:user)

    @routine = Routine.new
    @routines = Routine.where(user: current_user.id).group(:content).count
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :image, :start_time).merge(user_id: current_user.id)
  end
end
