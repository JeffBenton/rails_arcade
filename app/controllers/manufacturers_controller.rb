class ManufacturersController < ApplicationController
  before_action :find_manufacturer, only: [:show, :edit, :update]

  def index
    @manufacturers = Manufacturer.all
  end

  def show
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    manufacturer = Manufacturer.create(manufacturer_params)
    redirect_to manufacturer
  end

  def edit
  end

  def update
    @manufacturer.update(manufacturer_params)
    if @manufacturer.save
      redirect_to manufacturer_path(@manufacturer)
    else
      return redirect_to edit_manufacturer_path(@manufacturer)
    end
  end

  private

  def find_manufacturer
    @manufacturer = Manufacturer.find_by(id: params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end