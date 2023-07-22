class Spend < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories
  has_many :category_spends, through: :categories

  accepts_nested_attributes_for :category_spends

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }

  private
end
