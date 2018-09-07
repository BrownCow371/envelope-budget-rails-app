class Expense < ApplicationRecord
  belongs_to :users
  belongs_to :category
end
