class GamesController < ApplicationController
  before_action :set_game, only: %i(show edit update destroy)
  before_action :authenticate_user!, only: %i(show edit update destroy)

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path, notice: '作成しました'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to games_path, notice: '編集しました'
    else
      render :new
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path, notice: '削除しました'
  end
  private
  def game_params
    params.require(:game).permit(:content)
  end
  def set_game
    @game = Game.find(params[:id])
  end
end
