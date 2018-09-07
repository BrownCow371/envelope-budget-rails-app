class Category < ApplicationRecord
  has_many :expenses
  has_many :users, through: :expenses

  validates :name, presence: true

  # def self.most_expenses
  #   hash = self.joins(:users).group("category_id").sum("exp_amount")
  #   # hash.select {|cat, sum| sum.max}
  # end


  # def self.sum_by_category(category_id)
  #   where("category_id =?", category_id).group("category_id").sum("exp_amount").values[0]
  # end

end
