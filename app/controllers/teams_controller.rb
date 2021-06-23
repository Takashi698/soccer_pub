class TeamsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @team = Team.new
  end

  def show
    @team = Team.find(params[:id])
  end
end
