
// Epense Class
class Expense {

  constructor(attributes){
    this.id = attributes.id;
    this.user_id = attributes.user_id;
    this.category_id = attributes.category_id;
    this.exp_amount = attributes.exp_amount;
    this.exp_date= attributes.exp_date;
    this.payee = attributes.payee;
    this.category = attributes.category;
  }

  viewExpenseLink(){
    return `<a href="/users/${this.user_id}/expenses/${this.id}">View Expense</a>`
  }

  editExpenseLink(){
    return `<a href="/users/${this.user_id}/expenses/${this.id}/edit">Edit Expense</a>`
  }

  removeExpenseLink(){
    return `<a data-confirm="Are you sure you want to remove this expense?" rel="nofollow" data-method="delete" href="/users/${this.user_id}/expenses/${this.id}">Remove Expense</a>`
  }


  renderExpenseRow(){
    return `<tr class="expense_row">
              <td>${this.exp_date}</td>
              <td>${this.payee}</td>
              <td>${(this.exp_amount).toLocaleString('en-US', {style: 'currency', currency: 'USD'})}</td>
              <td>${this.category.name}</td>
              <td>${this.viewExpenseLink()}</td>
              <td>${this.editExpenseLink()}</td>
              <td>${this.removeExpenseLink()}</td>
            </tr>`

  }
  // end of class
}

//Constructor version
// function Expense(attributes){
//   this.id = attributes.id;
//   this.user_id = attributes.user_id;
//   this.category_id = attributes.category_id;
//   this.exp_amount = attributes.exp_amount;
//   this.exp_date= attributes.exp_date;
//   this.payee = attributes.payee;
//   this.category = attributes.category;
// }
//
// Expense.prototype.viewExpenseLink = function(){
//   return `<a href="/users/${this.user_id}/expenses/${this.id}">View Expense</a>`
// }
//
// Expense.prototype.editExpenseLink = function(){
//   return `<a href="/users/${this.user_id}/expenses/${this.id}/edit">Edit Expense</a>`
// }
//
// Expense.prototype.removeExpenseLink = function(){
//   return `<a data-confirm="Are you sure you want to remove this expense?" rel="nofollow" data-method="delete" href="/users/${this.user_id}/expenses/${this.id}">Remove Expense</a>`
// }
//
//
// Expense.prototype.renderRow = function(){
//   return `<tr class="expense_row">
//             <td>${this.exp_date}</td>
//             <td>${this.payee}</td>
//             <td>${(this.exp_amount).toLocaleString('en-US', {style: 'currency', currency: 'USD'})}</td>
//             <td>${this.category.name}</td>
//             <td>${this.viewExpenseLink()}</td>
//             <td>${this.editExpenseLink()}</td>
//             <td>${this.removeExpenseLink()}</td>
//           </tr>`
//
// }

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
