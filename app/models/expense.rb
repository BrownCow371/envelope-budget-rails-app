class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :exp_amount, presence: true
  validates :exp_amount, numericality: true

  validates :payee, presence: true
  validate :exp_date_valid

  def exp_date_valid
     if exp_date.nil? || exp_date_format_not_valid?
       errors.add(:exp_date, "Cannot be blank and must be provided in yyyy-mm-dd format and must be a valid date.")
     end
  end

  def exp_date_format_not_valid?
    if exp_date
       y, m, d = exp_date.to_s.split('-')
       !(Date.valid_date?(y.to_i, m.to_i, d.to_i))
     end
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
    self.save
  end

  def category_name
    self.category ? self.category.name : nil
  end

  def self.by_user(user_id)
    where(user: user_id)
  end

  def self.by_category(category_id)
    where(category: category_id)
  end

  def self.last_five
    self.all.order("id DESC").limit(5)
  end

  # def self.largest_by_user(user_id)
  #   where(user: user_id).order("exp_amount DESC").limit(1)
  # end

  def self.largest
    self.order("exp_amount DESC").limit(1)
  end

  def self.from_today
    where("exp_date =?", Date.today)
  end

  def self.from_this_month
    month_number = Date.today.month
    month_beginning = Date.new(Date.today.year, month_number)
    month_ending = month_beginning.end_of_month
    where("exp_date <= ? AND exp_date >= ?", month_ending, month_beginning)
  end

  def self.sum_by_specific_category(category_id)
    where("category_id =?", category_id).group("category_id").sum("exp_amount").values[0]
  end

  def self.sum_by_specific_category
    # returns hash of category_id, sum of expenses key, pairs.
    group("category_id").sum("exp_amount")
  end

  def self.category_w_largest_expense_sum
    #returns hash of category id with sum of expenses
    group("category_id").sum("exp_amount").max_by{|k,v| v}
  end


end
