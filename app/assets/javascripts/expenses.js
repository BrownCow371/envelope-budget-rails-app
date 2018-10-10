

//what do I need listeners for?
    // need a link on user show page for expenses - add dynamically to user show page
    // Need to create a "Next" link or button for expenses show page and hijack that
    // not sure about has-many relationship - might need to add Categories Index page with a link to show expenses per category
        // per Alice: as long as you are rendering the expenses by getting it through the User model JSON then yes, you can have one user and their associated expenses.
    // hijack on submit for new expense form?
        // need to show new expense right on New expense Form?
        // or does this need to be a new expense form on a category show page?
        // or do I need to modify my expenses index page to have a means of creating a new expense that then shows up dynamically in the list?
// Constructor Function - Expense
function Expense(attributes){
  this.id = attributes.id;
  this.user_id = attributes.user_id;
  this.category_id = attributes.category_id;
  this.exp_amount = attributes.exp_amount;
  this.exp_date= attributes.exp_date;
  this.payee = attributes.payee;
}

Expense.prototype.renderTable = function(){
  return `<li>${this.payee}</li>`
}

function User(attributes){
  this.id = attributes.id;
  this.email = attributes.email;
  this.username = attributes.username;
  this.name = attributes.name;
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
      expenseRow = expense.renderTable()
      $("div#js-temporary").append(expenseRow)
    }, "json")

  // end submit button listener
  });

  //Listener for link on user show page
  $("#js-list-expenses").on("click", function(event){
    event.preventDefault();
    //placeholder functionality
    alert("You Clicked the Expenses Link!");
  })

  //Listener for next expense on expense show page
  $("#js-next-expense").on("click", function(event){
    event.preventDefault();
    //placeholder functionality
    alert("You Clicked the Next Expense Link!");
  })

//end actionListener
}


// 1) need to add a serializer for expenses
// 2) need to render User Expenses index page via JSON/JS
      //a)so...hijack a button?
      //b)fire ajax request to get data
      //c)when server response with JSON iterate over the JSON data and inject into DOM
// 3) need to  add a next button to Expenses show page to serve up next expense via JSON/JS
// 4) need to render one has many relationship via JSON using JS
      // a) each user has many expenses - add link to show maybe last 5 expenses?
      // b) or need to create a new category show page per user and render expenses per category via ajax
// 5) need to render a form for a new expense that submits dynamically
// 6) translate JSON response into JS Model Object
// wait for document ready

$(function(){
  attachListeners();
})
