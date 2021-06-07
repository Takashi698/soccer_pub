class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end
end
