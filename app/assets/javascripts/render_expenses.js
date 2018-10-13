let newExpenseHeader = () => {
  return `<br><br><br>
          <h3> New Expense Added:</h3>`;
}

let renderExpenseTable = () => {
  return `<table id="expense_table">
            <tbody id="js-expense-table-body">
              <tr>
                <th>Date</th><th>Payee</th><th>Amount</th><th>Category</th><th>Expense Details</th><th>Edit Expense</th><th>Remove Expense</th>
              </tr>
            </tbody>
          </table>`
        }


let renderNextExpense = (data) => {
  //find all of this user's expenses
  let user = new User(data);
  let userExpenses = user.expenses;

  //find the current expense
  let expenseId = parseInt($("#js-next-expense").attr("data-id"));
  let arrayExpenseIds = userExpenses.map(expense => expense.id);
  let index = arrayExpenseIds.indexOf(expenseId);

  //find the next expense
  let nextExpenseId = arrayExpenseIds[++index];

  if (index === arrayExpenseIds.length) {
    nextExpenseId = arrayExpenseIds[0];
  }
  let nextExpenseData = userExpenses.find(expense => expense.id === nextExpenseId);
  let nextExpense = new Expense(nextExpenseData);

  //get next expense category name
  nextExpenseCat = user.categories.find(category => category["id"] === nextExpense.category_id);
  nextExpense.category = nextExpenseCat;
  //render next expense on page
  let expenseRow = nextExpense.renderExpenseRow();
  $(".expense_row").replaceWith(expenseRow);
  $("#js-next-expense").attr("data-id", nextExpense.id);
}

let renderExpenseIndex = (data) =>{
  //find user expenses
  let user = new User(data);
  let userExpenses = user.expenses;

  //reset div for expenses index and render table shell and header
  $("#js-user-show-expenses").empty();
  $("#js-user-show-expenses").append(renderExpenseTable());

  //Iterate through expenses, find category name, render a row in the table for each expense
  userExpenses.forEach((expenseData, index) =>{
    let expense = new Expense(expenseData);
    expense.category = user.categories.find(category =>category["id"] === expense.category_id);
    $("#js-expense-table-body").append(expense.renderExpenseRow());
  })
}

let renderNewExpense = (json) =>{
  //create expense JS object
  let expense = new Expense(json);
  expense.category = json["category"];

  // reset DOM, add header, table and row for new expense
  $("div#js-temporary").empty();
  $("div#js-temporary").append(newExpenseHeader());
  $("div#js-temporary").append(renderExpenseTable());
  $("#js-expense-table-body").append(expense.renderExpenseRow());

  // reset form and reactivate submit button
  document.getElementById("new_expense").reset();
  $('.js-button-reset').prop('disabled', false);
}
