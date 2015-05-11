class JoinsController < ApplicationController

  def new
    @game = Game.find(params[:game_id])
    create
  end

  def create
    @join = @game.joins.build_with_user(current_user)
    if @join.save
      flash[:notice] = "You have joined #{@game.name}"
      redirect_to games_path
    else
      render :new
    end
  end

  def destroy
    @join = Join.find(params[:id])
    if current_user == @join.user
      @join.destroy
      flash[:notice] = 'You left the game'
    else
      flash[:notice] = 'Cannot leave the game'
    end
    redirect_to '/games'
  end
end
