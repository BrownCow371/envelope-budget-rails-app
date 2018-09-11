class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
        u.name= auth_hash['info']['name']
        u.email= auth_hash['info']['email']
        # u.username= auth_hash['info']['username']
        u.password= SecureRandom.hex
      end
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(email: params[:email])

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
