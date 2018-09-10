
module ExpensesHelper

  def expense_detail_table_header
    columns = ["Date",
              "Payee",
              "Amount",
              "Category",
              "Edit Expense",
              "Remove Expense"
              ]
    columns.collect { |column| content_tag(:th, column) }.join().html_safe
  end


  def expense_detail_table_row(user, expense)
    data = [expense.exp_date,
              expense.payee,
              number_to_currency(expense.exp_amount),
              expense.category.name,
              (link_to "Edit Expense", edit_user_expense_path(user, expense)),
              (link_to "Remove Expense", user_expense_path(user, expense), method: :delete, data: { confirm: "Are you sure you want to remove this expense?" })
            ]
    data.collect { |column| content_tag(:td, column) }.join().html_safe
  end
end
