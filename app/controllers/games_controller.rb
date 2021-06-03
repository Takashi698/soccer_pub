class GamesController < ApplicationController
  before_action :authenticate_user!, only: %i(show edit update destroy)
  before_action :set_game, only: %i(show edit update destroy)

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.build(permitted_parameter)
    # @game = Game.new(permitted_parameter)
    # @game.user_id = current_user.id

    # binding.pry
    if @game.save
      redirect_to games_path, notice: '作成しました'
    else
      render :new
    end
  end

  def show
    @comments = @game.comments
    @comment = @game.comments.build
  end

  def edit
  end

  def update
    if @game.update(permitted_parameter)
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
  def set_game
    @game = Game.find(params[:id])
  end
  def permitted_parameter
    params.require(:game).permit(:content)
  end
end
