class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]

  def new
    redirect_to games_path if is_logged_in?
  end

  def create
    @user = User.find_by(name: params[:name])
    return redirect_to root_url,
                       notice: 'Username or password incorrect' if @user.nil? || !@user.authenticate(params[:password])

    session[:user_id] = @user.id
    redirect_to games_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end