class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(game_id: params[:game_id])
    redirect_to games_path, notice: 'お気に入りしました'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    favorite.destroy
    redirect_to games_path, notice: 'お気に入りを解除しました'
  end
end