class ManufacturersController < ApplicationController
  before_action :find_manufacturer, only: [:show, :edit, :update]
  before_action :require_logged_in
  before_action :require_admin, only: [:new, :create, :edit, :update]

  def index
    @manufacturers = Manufacturer.all
  end

  def show
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.create(manufacturer_params)
    if @manufacturer.valid?
      redirect_to manufacturer_path(@manufacturer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @manufacturer.update(manufacturer_params)
    if @manufacturer.valid?
      redirect_to manufacturer_path(@manufacturer)
    else
      render :edit
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