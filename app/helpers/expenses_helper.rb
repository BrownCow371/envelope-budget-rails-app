
module ExpensesHelper

  def expense_detail_table_header
    columns = ["Date",
              "Payee",
              "Amount",
              "Category",
              "Expense Details",
              "Edit Expense",
              "Remove Expense"
              ]
    columns.collect { |column| content_tag(:th, column) }.join().html_safe
  end


  def expense_detail_table_row(user, expense)
    row = [expense.exp_date,
              expense.payee,
              number_to_currency(expense.exp_amount),
              expense.category.name,
              (link_to "View Expense", user_expense_path(user, expense)),
              (link_to "Edit Expense", edit_user_expense_path(user, expense)),
              (link_to "Remove Expense", user_expense_path(user, expense), method: :delete, data: {confirm: "Are you sure you want to remove this expense?" })
            ]
    row.collect { |table_field| content_tag(:td, table_field) }.join().html_safe
  end
end
