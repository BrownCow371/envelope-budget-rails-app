class ExpensesController < ApplicationController
  before_action :require_logged_in
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_user_by_params

  def stats
  end

  def last_five
    @expenses = @user.expenses.last_five
  end

  def index
    # need to render User Expenses index page via JSON/JS
    filter_results
  end

  def show
    if !expense_user_valid?
      redirect_to user_expenses_path(current_user), alert: "SHOW: Expense not found or you are not authorized to see this page, redirected to your expenses page."
    end
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = @user.expenses.build(expense_params)
    if user_valid? && @expense.save
      redirect_to user_expenses_path(@user), alert: "Expense added!"
    else
      render 'new'
    end
  end

  def edit
    if !expense_user_valid?
      redirect_to user_expenses_path(current_user), alert: "EDIT: Expense not found or you are not authorized to edit this expense, redirected to your expenses page."
    end
  end

  def update
    if expense_user_valid? && @expense.update(expense_params)
        redirect_to user_expenses_path(@user), alert: "Expense Updated!"
    elsif !@expense.update(expense_params)
        render 'edit'
    else
      redirect_to user_expenses_path(current_user), alert: "UPDATE: Expense not found or you are not authorized to update this expense, redirected to your expenses page."
    end
  end

  def destroy
    if user_valid? && expense_user_valid?
      @expense.destroy
      redirect_to user_expenses_path(@user), alert: "Expense removed from your list of expenses."
    else
      redirect_to user_expenses_path(current_user), alert: "DELETE: You cannot destroy expenses that are not assocaited with your account. Redirected to your expenses page."
    end
  end


private

  def set_expense
    @expense = Expense.find_by_id(params[:id])
  end

  def set_user_by_params
    @user = User.find_by_id(params[:user_id]) if (params[:user_id] && current_user.id == params[:user_id].to_i)
    if @user.nil?
      redirect_to user_path(current_user), alert: "SET USER ERROR: You cannot view or modify another user's account/expenses. Redirected to your account."
    end
  end

  def user_valid?
    @user && @user.id == current_user.id
  end

  def expense_user_valid?
    @expense && @expense.user_id == current_user.id
  end

  def expense_params
    params.require(:expense).permit(:payee, :exp_date, :exp_amount, :category_name, category_new: [:name])
  end

 def filter_results
   if !params[:category].blank?
     @expenses = @user.expenses.by_category(params[:category])
     # flash[:message] = "#{Category.find_by_id(params[:category].to_i).name} Category Expenses"
     flash[:message] = "#{@expenses.first.category.name} Category Expenses"
   elsif !params[:date].blank?
     if params[:date] == "Today"
       @expenses = @user.expenses.from_today
       flash[:message] = "Today's Expenses"
     elsif params[:date] =="This Month"
       @expenses = @user.expenses.from_this_month
       flash[:message] = "This Month's Expenses"
     end
   else
     @expenses = @user.expenses
    flash[:message] = ""
   end
 end

  # coming soon
  # def stats_hash
  #   largest expense
  #   largest category
  #   total today
  #   total this month
  # end

end
