class GamesController < ApplicationController
  def index
    @game = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params)
    redirect_to '/games'
  end

  private
  def game_params
    params.require(:game).permit(:name, :location, :date_time)
  end
end
