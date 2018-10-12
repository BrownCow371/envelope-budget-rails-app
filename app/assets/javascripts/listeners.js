//what do I need listeners for?
    // need a link on user show page for expenses - add dynamically to user show page
    // Need to create a "Next" link or button for expenses show page and hijack that
    // not sure about has-many relationship - might need to add Categories Index page with a link to show expenses per category
        // per Alice: as long as you are rendering the expenses by getting it through the User model JSON then yes, you can have one user and their associated expenses.
    // hijack on submit for new expense form?
        // need to show new expense right on New expense Form?
        // or does this need to be a new expense form on a category show page?
        // or do I need to modify my expenses index page to have a means of creating a new expense that then shows up dynamically in the list?

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
    let expenseRow = nextExpense.renderRow();
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
      $("#js-expense-table-body").append(expense.renderRow());
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
    $("#js-expense-table-body").append(expense.renderRow());

    // reset form and reactivate submit button
    document.getElementById("new_expense").reset();
    $('.js-button-reset').prop('disabled', false);
  }

  let attachListeners = () => {
    // Listener for submit button for new expense
    $("form#new_expense").on("submit", function(event){
      event.preventDefault();
      let new_form = $(this);
      let action = new_form.attr("action");
      let params = new_form.serialize();

      $.post(action, params, function(json){
        renderNewExpense(json);
      }, "json")
    });

    //Listener for index of expenses link on user show page
    $("#js-list-expenses").on("click", function(event){
      event.preventDefault();
      $.get(`/users/${$(this).attr("data-userId")}`, function(data){
        renderExpenseIndex(data);
      })
    })

    //Listener for next expense on expense show page
    $("#js-next-expense").on("click", function(data){
      data.preventDefault();
      $.get(`/users/${$(this).attr("data-userId")}`, function(data){
        renderNextExpense(data)
      })
    })
  //end actionListener
  }

// add listener to DOM when ready/loaded
  $(function(){
    attachListeners();
  })
