class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update]

  def index
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
  end

  private

  def find_game
    game = Game.find_by(id: params[:id])
  end

  def game_params(*args)
    params.require(:game).permit(:name, :token_cost, :manufacturer_id, manufacturer_attributes: [:name])
  end
end