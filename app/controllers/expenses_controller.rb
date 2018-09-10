class ExpensesController < ApplicationController
  before_action :require_logged_in
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_user_by_params

  def index
    # raise @user.inspect
    if user_valid?
      @expenses = @user.expenses
    end
  end

  def show
    if !user_valid?
      redirect_to user_expenses_path(current_user), alert: "User not found or you are not authorized to see this page, redirected to your expenses page."
    elsif !@expense || @expense.user_id != current_user.id
      redirect_to user_expenses_path(current_user), alert: "Expense not found or you are not authorized to see this page, redirected to your expenses page."
    end
  end

  def new
    @expense = Expense.new
    if !user_valid?
      redirect_to new_user_expense_path(current_user), alert: "You can only add expenses to your own account. Redirected to your new expense page."
    end
  end

  def create
    # raise params.inspect
    @expense = @user.expenses.build(expense_params)

    if user_valid? && @expense.save
      redirect_to user_expenses_path(@user), alert: "Expense added!"
    else
      render 'new'
    end
  end

  def edit
    if !user_valid?
      redirect_to user_expenses_path(current_user), alert: "User not found or you are not authorized to edit this expense, redirected to your expenses page."
    elsif !@expense || @expense.user_id != current_user.id
      redirect_to user_expenses_path(current_user), alert: "Expense not found or you are not authorized to edit this expense, redirected to your expenses page."
    end

  end

  def update
    if user_valid? && @expense.user_id == @user.id
      if @expense.update(expense_params)
        redirect_to user_expenses_path(@user)
      else
        render 'edit'
      end
    else
      redirect_to user_expenses_path(current_user), alert: "Expense not found or you are not authorized to update this expense, redirected to your expenses page."
    end
  end

  def destroy
    if user_valid? && @expense.user_id == @user.id
      @expense.destroy
      redirect_to user_expenses_path(@user), alert: "Expense removed from your list of expenses."
    else
      redirect_to user_expenses_path(current_user), alert: "You cannot destroy expenses that are not assocaited with your account. Redirected to your expenses page."
    end
  end

private

  def set_expense
    @expense = Expense.find_by_id(params[:id])
  end

  def set_user_by_params
    @user = User.find_by_id(params[:user_id]) if (params[:user_id] && current_user.id == params[:user_id].to_i)
    if @user.nil? ||
      redirect_to user_path(current_user), alert: "You are not allowed to view the accounts of other users. Redirected to your account."
    end
  end

  def user_valid?
    @user && @user.id == current_user.id
  end

  def expense_params
    params.require(:expense).permit(:payee, :exp_date, :exp_amount, :category_name)
  end


end
