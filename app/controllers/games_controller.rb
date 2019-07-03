class GamesController < ApplicationController
  before_action :find_game, only: [:show, :edit, :update]
  before_action :require_logged_in

  def index
    @games = Game.all
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.valid?
      redirect_to @game
    else
      render :new
    end
  end

  def edit
  end

  def update
    @game.update(game_params)
    if @game.valid?
      redirect_to game_path(@game)
    else
      render :edit
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