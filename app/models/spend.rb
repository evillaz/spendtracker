class Spend < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories
  has_many :category_spends, through: :categories

  validates :name, :amount, presence: true
end
