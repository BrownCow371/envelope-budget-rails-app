class User < ActiveRecord::Base
  has_many :expenses
  has_many :categories, through: :expenses

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true

  validates :email, presence: true
  validates :email, uniqueness: true

end
