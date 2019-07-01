class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update]

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params)
    redirect_to game
  end

  def edit
  end

  def update
    @game.update(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      return redirect_to edit_game_path(@game)
    end
  end

  private

  def find_game
    @game = Game.find_by(id: params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :token_cost, :manufacturer_id, manufacturer_attributes: [:name])
  end
end