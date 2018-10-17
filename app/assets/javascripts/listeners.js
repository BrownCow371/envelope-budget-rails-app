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
          body: new_form,
          headers: new Headers({
        		'Accept': 'application/json'
        	})
        })
        .then(response => response.json())
          .then(json => renderNewExpense(json))
    });

    //Listener for index of sorted expenses link on user show page
    $("#js-list-expenses").on("click", function(event){
      event.preventDefault();

    // JQuery Solution
      // $.get(`/users/${$(this).attr("data-userId")}`, function(data){
      //   renderExpenseIndex(data);
      // })

      fetch(`/users/${$(this).attr("data-userId")}`, {
        headers:{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        }
      })
        .then(response => response.json())
          .then(json => {
            //sorts in place
            json["expenses"].sort((a, b) => a.exp_date > b.exp_date)
            renderExpenseIndex(json)
          })
    })

    //Listener for next expense on expense show page
    $("#js-next-expense").on("click", function(data){
      data.preventDefault();

    // JQuery Solution
      // $.get(`/users/${$(this).attr("data-userId")}`, function(data){
      //   renderNextExpense(data)
      // })

      fetch(`/users/${$(this).attr("data-userId")}`, {
          headers:{
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }
      })
        .then(response => response.json())
          .then(json => renderNextExpense(json))
    })
  //end actionListener
  }

// add listener to DOM when ready/loaded
  $(function(){
    attachListeners();
  })
