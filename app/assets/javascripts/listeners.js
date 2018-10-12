//what do I need listeners for?
    // need a link on user show page for expenses - add dynamically to user show page
    // Need to create a "Next" link or button for expenses show page and hijack that
    // not sure about has-many relationship - might need to add Categories Index page with a link to show expenses per category
        // per Alice: as long as you are rendering the expenses by getting it through the User model JSON then yes, you can have one user and their associated expenses.
    // hijack on submit for new expense form?
        // need to show new expense right on New expense Form?
        // or does this need to be a new expense form on a category show page?
        // or do I need to modify my expenses index page to have a means of creating a new expense that then shows up dynamically in the list?


  let attachListeners = () => {
    // Listener for submit button for new expense
    $("form#new_expense").on("submit", function(event){
      event.preventDefault();
      let action = $(this).attr("action");

      // JQuery Solution
      // let new_form = $(this);
      // let params = new_form.serialize();
      // $.post(action, params, function(json){
      //   renderNewExpense(json);
      // }, "json");

    // reference: https://davidwalsh.name/fetch

      let new_form = new FormData(document.getElementById('new_expense'))

      fetch(action, {
          method: "POST",
          body: new_form
        })
        .then(response => response.json())
          .then(json => renderNewExpense(json))
    });

    //Listener for index of expenses link on user show page
    $("#js-list-expenses").on("click", function(event){
      event.preventDefault();
      // JQuery Solution
      // $.get(`/users/${$(this).attr("data-userId")}`, function(data){
      //   renderExpenseIndex(data);
      // })
      fetch(`/users/${$(this).attr("data-userId")}`)
        .then(response => response.json())
          .then(json => renderExpenseIndex(json))
    })

    //Listener for next expense on expense show page
    $("#js-next-expense").on("click", function(data){
      data.preventDefault();
      // JQuery Solution

      // $.get(`/users/${$(this).attr("data-userId")}`, function(data){
      //   renderNextExpense(data)
      // })
      fetch(`/users/${$(this).attr("data-userId")}`)
        .then(response => response.json())
          .then(json => renderNextExpense(json))
    })
  //end actionListener
  }

// add listener to DOM when ready/loaded
  $(function(){
    attachListeners();
  })
