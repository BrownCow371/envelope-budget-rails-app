//what do I need listeners for?
    // need a link on user show page for expenses - add dynamically to user show page
    // Need to create a "Next" link or button for expenses show page and hijack that
    // not sure about has-many relationship - might need to add Categories Index page with a link to show expenses per category
        // per Alice: as long as you are rendering the expenses by getting it through the User model JSON then yes, you can have one user and their associated expenses.
    // hijack on submit for new expense form?
        // need to show new expense right on New expense Form?
        // or does this need to be a new expense form on a category show page?
        // or do I need to modify my expenses index page to have a means of creating a new expense that then shows up dynamically in the list?
  let nextExpense = (data) => {
    //find all of this user's expenses
    let user = new User(data);
    let userExpenses = user.expenses;

    //find the current expense
    let expenseId = parseInt($("#js-next-expense").attr("data-id"))
    let arrayExpenseIds = userExpenses.map(expense => expense.id);
    let index = arrayExpenseIds.indexOf(expenseId);

    //find the next expense
    let nextExpenseId = arrayExpenseIds[++index];

    if (index === arrayExpenseIds.length) {
      nextExpenseId = arrayExpenseIds[0]
    }
    let nextExpenseData = userExpenses.find(expense => expense.id === nextExpenseId);
    let nextExpense = new Expense(nextExpenseData);

    //get next expense category name
    nextExpenseCat = user.categories.find(category => category["id"] === nextExpense.category_id)
    // console.log("category", nextExpenseCat)
    nextExpense.category_name = nextExpenseCat["name"]
    //render next expense on page
    let expenseRow = nextExpense.renderRow();
    $(".expense_row").replaceWith(expenseRow)
    $("#js-next-expense").attr("data-id", nextExpense.id)
  }

  let newExpenseHeader = () => {
    return `<br><br><br>
            <h3> New Expense Added:</h3>`
  }

  let attachListeners = () => {
    // Listener for submit button for new expense
    $("form#new_expense").on("submit", function(event){
      event.preventDefault();
      let new_form = $(this);
      let action = new_form.attr("action");
      let params = new_form.serialize();

      $.post(action, params, function(json){
        console.log("response data", json)
        let expense = new Expense(json);
        expense.category = json["category"]
        // let expenseTable = expense.renderTable()
        $("div#js-temporary").empty()
        $("div#js-temporary").append(newExpenseHeader())
        $("div#js-temporary").append(expense.renderTable())

        // reset form and reactivate submit button
        document.getElementById("new_expense").reset()
        $('.js-button-reset').prop('disabled', false)
      }, "json")

    // end submit button listener
    });

    //Listener for link on user show page
    $("#js-list-expenses").on("click", function(event){
      event.preventDefault();

    })

    //Listener for next expense on expense show page
    $("#js-next-expense").on("click", function(data){
      data.preventDefault();
      $.get(`/users/${$(this).attr("data-userId")}`, function(data){
        nextExpense(data)
      // end of get request
      })
    // end of my next button listener
    })
  //end actionListener
  }


  $(function(){
    attachListeners();
  })
