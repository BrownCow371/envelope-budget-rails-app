class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    respond_to do |f|
      f.html {render 'show'}
      f.json {render :json => @user}
    end
    if @user.nil?
      respond_to do |f|
        f.html {redirect_to user_path(current_user), alert: "User not found or you are not authorized to view this account. Redirected to your account."}
      end
    end
  end

  def edit
    if @user.nil?
      redirect_to user_path(current_user), alert: "User not found or you are not authorized to edit this account. Redirected to your account."
    end
  end

  def update
    # raise params.inspect
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

private

  def set_user
    @user = User.find_by_id(params[:id]) if params[:id].to_i == current_user.id
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
