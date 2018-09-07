# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Fred", email: "fred@rails.com", password: "password", username: "Fred25")
User.create(name: "George", email: "george@rails.com", password: "password", username: "George25")
User.create(name: "Kathy", email: "kathy@rails.com", password: "password", username: "Kathy25")
User.create(name: "Linda", email: "linda@rails.com", password: "password", username: "Linda25")
User.create(name: "Clara", email: "clara@rails.com", password: "password", username: "Clara25")
User.create(name: "Bob", email: "bob@rails.com", password: "password", username: "Bob25")


Category.create(name: "Groceries")
Category.create(name: "Eating Out")
Category.create(name: "Fuel")
Category.create(name: "Housing")
Category.create(name: "Clothes Shoes")
Category.create(name: "Fitness")
Category.create(name: "Utilities")
Category.create(name: "Home Improvement")
Category.create(name: "Pet Care")
Category.create(name: "Health")
Category.create(name: "Transportation")
Category.create(name: "Entertainment")



Expense.create(payee: "Target", exp_date: "2018-09-07", amount: 4.50, user_id: 2, category_id: 5)
Expense.create(payee: "Wegmans", exp_date: "2018-09-07", amount: 10.85, user_id: 1, category_id: 1)
Expense.create(payee: "Jack Auto", exp_date: "2018-09-05", amount: 400.60, user_id: 3, category_id: 11)
Expense.create(payee: "Fast Trak", exp_date: "2018-09-01", amount: 43.50, user_id: 4, category_id: 3)
Expense.create(payee: "Pet Supply", exp_date: "2018-09-04", amount: 54.50, user_id: 6, category_id: 9)
Expense.create(payee: "DSW", exp_date: "2018-09-04", amount: 64.50, user_id: 5, category_id: 5)
Expense.create(payee: "TJ Maxx", exp_date: "2018-09-06", amount: 104.50, user_id: 1, category_id: 5)
Expense.create(payee: "Orange Theory", exp_date: "2018-09-05", amount: 94.50, user_id: 2, category_id: 6)
Expense.create(payee: "Greenlight", exp_date: "2018-09-05", amount: 54.50, user_id: 3, category_id: 7)
Expense.create(payee: "RGE", exp_date: "2018-09-06", amount: 124.50, user_id: 4, category_id: 7)
Expense.create(payee: "Progressive", exp_date: "2018-09-08", amount: 44.50, user_id: 5, category_id: 11)
Expense.create(payee: "Silver Iguana", exp_date: "2018-09-04", amount: 34.50, user_id: 6, category_id: 2)
Expense.create(payee: "Gate House", exp_date: "2018-09-02", amount: 46.50, user_id: 1, category_id: 2)
Expense.create(payee: "Home Depot", exp_date: "2018-09-03", amount: 14.50, user_id: 2, category_id: 8)
Expense.create(payee: "Regal", exp_date: "2018-09-07", amount: 14.50, user_id: 3, category_id: 12)
Expense.create(payee: "CVS", exp_date: "2018-09-07", amount: 24.50, user_id: 4, category_id: 10)
Expense.create(payee: "Wegmans", exp_date: "2018-09-07", amount: 44.50, user_id: 2, category_id: 1)
Expense.create(payee: "Wegmans", exp_date: "2018-09-07", amount: 34.50, user_id: 2, category_id: 1)
