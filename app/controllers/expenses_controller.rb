class ExpensesController < ApplicationController
  before_action :require_logged_in

  def index
    # raise current_user.id.inspect
    @user = User.find_by_id(params[:user_id]) if params[:user_id]

    if @user && @user.id == current_user.id
      @expenses = @user.expenses
    else
      redirect_to user_path(current_user), alert: "User not found or you are not authorized to see this user's page, redirected to your user page."
    end
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
