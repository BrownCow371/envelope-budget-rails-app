class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_url
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
