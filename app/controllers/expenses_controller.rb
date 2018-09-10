class ExpensesController < ApplicationController
  before_action :require_logged_in

  def index
    if params[:user_id]
      @user = User.find_by_id(params[:user_id])
      if @user.nil? || @user_id != current_user.id
        redirect_to user_path(current_user), alert: "User not found, redirected to your user page."

  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
