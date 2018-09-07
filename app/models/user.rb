class User < ActiveRecord::Base
  has_many :expenses
  has_many :categories, through: :expenses

  has_secure_password
end
