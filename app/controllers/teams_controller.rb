class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: %i(show edit update destroy)
  
  def index
    @teams = Team.all
  end 

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.build(permitted_parameters)
    if @team.save
      redirect_to teams_path, notice: '作成しました'
    else
      render :new
    end
  end


  def show
    @team = Team.find(params[:id])
  end

  def edit
  end

  def update
    if @team.update(permitted_parameters)
      redirect_to teams_path, notice: '編集しました'
    else
      render :new
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: '削除しました'
  end

  private
  def set_team
    @team = Team.find(params[:id])
  end

  def permitted_parameters
    params.require(:team).permit(:name, :image, :image_cache, :description)
  end
end

