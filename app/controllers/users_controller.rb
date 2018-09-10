class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, only: [:show, :edit, :update, :destroy]

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    # raise params.inspect
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  end

private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
  end
end
