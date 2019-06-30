class ManufacturersController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    manufacturer = Manufacturer.create(manufacturer_params)
    redirect_to root_url
  end

  def edit
  end

  def update
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end