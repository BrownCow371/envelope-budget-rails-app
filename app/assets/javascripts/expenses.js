
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
  return `<br><br><br>
          <h3> New Expense Added:</h3>
          <table id="expense_table">
            <tbody><tr>
              <th>Date</th><th>Payee</th><th>Amount</th><th>Category</th>
            </tr>
            <tr>
              <td>${this.exp_date}</td>
              <td>${this.payee}</td>
              <td>${this.exp_amount}</td>
              <td>${this.category_id}</td>
            </tr>
          </tbody></table>`
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
