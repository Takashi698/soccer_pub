class GamesController < ApplicationController
  before_action :authenticate_user!, only: %i(show edit update destroy)
  before_action :set_game, only: %i(show edit update destroy)
  PER = 5

  def index
    @games = Game.page(params[:page]).per(PER)
    @q = Game.ransack(params[:q])
    @games = @q.result(distinct: true).page(params[:page]).per(PER)
  end

  def new
    @game = Game.new_and_build
  end

  def create
    @game = current_user.games.build(permitted_parameters)
    # @game.upshot.team_a_point = params[:team_a_point]
    # @game.upshot.team_b_point = params[:team_b_point]
    # @game = Game.new(permitted_parameter)
    # @game.user_id = current_user.id
    
    binding.pry
    if @game.save
      redirect_to games_path, notice: '作成しました'
    else
      render :new
    end
  end

  def show
    @favorite = current_user.favorites.find_by(game_id: @game.id)
    @comments = @game.comments
    @comment = @game.comments.build
  end

  def edit
  end

  def update
    if @game.update(permitted_parameters)
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
  def permitted_parameters
    params.require(:game).permit(:content, :place, :match_at, upshot_attributes: [:id, :team_a_id, :team_b_id, :team_a_point, :team_b_point])
  end
end