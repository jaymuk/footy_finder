class JoinsController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    create
  end

  def create
    @join = @game.joins.build_with_user(current_user)
    if @join.save
      notice[:flash] = "You have joined #{@game.name}"
      redirect_to games_path
    else
      render :new
    end
  end
end
