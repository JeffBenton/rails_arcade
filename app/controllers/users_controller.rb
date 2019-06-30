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
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      redirect_to games_path
    else
      return redirect_to root
    end
  end

  def edit
  end

  def update
    if  @user.name == params[:user][:name]
      return redirect_to user_path(@user)
    end

    if User.find_by(name: params[:user][:name]).nil?
      @user.update(user_params)
      if @user.save
        return redirect_to user_path(@user)
      end
    end
    redirect_to edit_user_path(@user)
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end