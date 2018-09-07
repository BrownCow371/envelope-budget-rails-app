class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :exp_amount, presence: true
  validates :exp_amount, numericality: true
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
end
