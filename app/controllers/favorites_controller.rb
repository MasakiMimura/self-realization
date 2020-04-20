class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    Favorite.create(favorite_params)
    redirect_to root_path
  end

  private
  def favorite_params
    params.require(:favorite).permit(:name, :rank, :image, :url).merge(user_id: current_user.id)
  end
end
