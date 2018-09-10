class ExpensesController < ApplicationController
  before_action :require_logged_in
  before_action :set_expense, only: [:show, :edit, :update, :destroy]

  def index
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
    @expense.destroy
    redirect_to user_expenses_path(@user), alert: "Expense removed from your list of expenses."
  end

private

  def set_expense
    @expense = Expense.find_by_id(params[:id])
    @user=@expense.user
  end

  def expense_params
    params.require(:expense).permit(:payee, :exp_date, :exp_amount, :category_name)
  end


end
