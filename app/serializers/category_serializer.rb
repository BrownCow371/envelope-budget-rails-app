class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :expenses
  has_many :users, through: :expenses
end
