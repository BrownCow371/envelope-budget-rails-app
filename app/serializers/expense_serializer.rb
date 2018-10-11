class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :payee, :exp_date, :exp_amount, :user_id, :category_id
  belongs_to :user
  belongs_to :category

end
