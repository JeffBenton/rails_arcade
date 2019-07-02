class PlaysController < ApplicationController
  def show
    @play = Play.find_by(id: params[:id])
  end

  def create
    play = Play.create(plays_params)
    play.play_game
    if play.save
      redirect_to play_path(play)
    else
      return redirect_to game_path(play.game)
    end
  end

  private

  def plays_params
    params.require(:plays).permit(:game_id, :difficulty, :user_id)
  end

end