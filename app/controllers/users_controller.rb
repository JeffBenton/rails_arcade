class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params(:name, :password))
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if  @user.name == params[:user][:name]
      return redirect_to user_path(@user)
    end

    @user.update(user_params(:name))
    if @user.validate_attribute(:name)
      @user.save(validate: false)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end