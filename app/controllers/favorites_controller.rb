class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @favorites = current_user.favorites.all
  end

  def create
    favorite = current_user.favorites.create(game_id: params[:game_id])
    redirect_to game_path(favorite.game_id), notice: 'お気に入りしました'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    favorite.destroy
    redirect_to game_path(favorite.game_id), notice: 'お気に入りを解除しました'
  end
end
