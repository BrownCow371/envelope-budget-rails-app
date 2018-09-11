class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash['uid']
      raise params.inspect
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name= auth_hash['info']['name']
        u.email= auth_hash['info']['email']
        u.password= SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(username: params[:username])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        redirect_to new_user_url
      end
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
