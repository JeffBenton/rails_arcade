class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    return redirect_to root_url if @user.nil? || !@user.authenticate(params[:password])

    session[:user_id] = @user.id
    redirect_to games_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_url
  end
end