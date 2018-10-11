class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :expenses
  has_many :categories, through: :expenses
end
